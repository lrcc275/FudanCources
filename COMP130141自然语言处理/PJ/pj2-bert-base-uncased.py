import warnings
# 设置忽略警告的级别
warnings.filterwarnings('ignore')
# 代码段
#使用transformer并导入模型
import torch
from torch.utils.data import DataLoader
from transformers import BertForSequenceClassification, BertTokenizer
model_name = 'bert-base-uncased'
tokenizer = BertTokenizer.from_pretrained(model_name)
model = BertForSequenceClassification.from_pretrained(model_name)

#导入数据集
from datasets import load_dataset
wnli_dataset = load_dataset("glue", "wnli")
mrpc_dataset = load_dataset("glue", "mrpc")

#预处理数据集
class ProcessDataset:
    def __init__(self, data):
        self.data = data
    def __len__(self):
        return len(self.data)
    def __getitem__(self, idx):
        return self.data[idx]

def collate_fn(batch):
    inputs = tokenizer(
        [item['sentence1'] for item in batch],
        [item['sentence2'] for item in batch],
        padding=True,
        truncation=True,
        return_tensors="pt"
    )
    labels = torch.tensor([item['label'] for item in batch])
    return {
        'input_ids': inputs['input_ids'],
        'token_type_ids': inputs['token_type_ids'],
        'attention_mask': inputs['attention_mask'],
        'labels': labels
    }

#针对WNLI任务,得到训练集和测试集
train_data = wnli_dataset["train"]
train_data = ProcessDataset(train_data)
test_data = wnli_dataset["validation"]
test_data = ProcessDataset(test_data)
test_dataloader = DataLoader(test_data, batch_size=8, shuffle=False, collate_fn=collate_fn)

#使用GPU
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

#定义训练和测试函数
def train(model,train_dataloader,num_epochs,optimizer,device):
    for epoch in range(num_epochs):
        for batch in train_dataloader:
            batch = {key: value.to(device) for key, value in batch.items()}
            outputs = model(**batch)
            logits = outputs.logits
            labels = batch["labels"].to(device)
            loss = torch.nn.functional.cross_entropy(logits, labels)
            loss.sum().backward()
            optimizer.step()

def test(model,test_dataloader,device):
    correct_predictions , total_samples = 0, 0
    with torch.no_grad():
        for batch in test_dataloader:
            batch = {key: value.to(device) for key, value in batch.items()}
            outputs = model(**batch)
            logits = outputs.logits
            predictions = torch.argmax(logits, dim=1)
            correct_predictions += torch.sum(predictions == batch["labels"]).item()
            total_samples += len(predictions)
        accuracy = correct_predictions / total_samples
    return accuracy

#未经Finetune
model = model.to(device)
model.eval()
r1 = test(model,test_dataloader,device)
print("Accuracy without Finetune is: ",r1)


#在不同的batch和lr下，经过微调的结果
import numpy as np
batch = [8,16,32]
lrs = [8e-5,1e-4,2e-4]
res = np.zeros((len(batch),len(lrs)))
i,j=0,0
for batch_size in batch:
    j=0
    train_dataloader = DataLoader(train_data, batch_size=batch_size, shuffle=True,collate_fn=collate_fn)
    for lr in lrs:
        net = BertForSequenceClassification.from_pretrained(model_name)
        net.to(device)
        optimizer = torch.optim.Adam(model.parameters(), lr=lr)
        train(net,train_dataloader,5,optimizer,device)
        net.eval()
        accu = test(net,test_dataloader,device)
        res[i,j] = accu
        j +=1
    i +=1

#可视化结果
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.DataFrame(data=res, index=batch, columns=lrs)
plt.figure(figsize=(8, 6))
sns.heatmap(df, annot=True, fmt=".4f", cmap="plasma", cbar=True)
plt.title("In a bert-base-uncased for MNLI,accuracy with different batch and lr")
plt.xlabel("lr")
plt.ylabel("batch")
plt.show()


#针对mrpc任务
train_data2 = mrpc_dataset["train"]
train_data2 = ProcessDataset(train_data2)
test_data2 = mrpc_dataset["validation"]
test_data2 = ProcessDataset(test_data2)
test_dataloader2 = DataLoader(test_data2, batch_size=8, shuffle=False, collate_fn=collate_fn)


#未经Finetune
model = model.to(device)
model.eval()
r2 = test(model,test_dataloader2,device)
print("Accuracy without Finetune is: ",r2)

#在不同的batch和lr下，经过微调的结果
import numpy as np
batch = [8,16,32]
lrs = [2e-3]
res2 = np.zeros((len(batch),len(lrs)))
i,j=0,0
for batch_size in batch:
    j=0
    train_dataloader2 = DataLoader(train_data2, batch_size=batch_size, shuffle=True,collate_fn=collate_fn)
    for lr in lrs:
        net = BertForSequenceClassification.from_pretrained(model_name)
        net.to(device)
        optimizer = torch.optim.Adam(model.parameters(), lr=lr)
        train(net,train_dataloader2,5,optimizer,device)
        net.eval()
        accu = test(net,test_dataloader2,device)
        res2[i,j] = accu
        j +=1
    i +=1

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
df2 = pd.DataFrame(data=res2, index=batch, columns=lrs)
plt.figure(figsize=(8, 6))
sns.heatmap(df2, annot=True, fmt=".4f", cmap="plasma", cbar=True)
plt.title("In a bert-base-uncased for MRPC,accuracy with different batch and lr")
plt.xlabel("lr")
plt.ylabel("batch")
plt.show()
