template <class T>
class Queue
{
public:
	//此处添加size_type的类型定义

	Queue();		//default constructor
	Queue(const Queue& q);	//copy constructor
	~Queue();		//destructor

	Queue& operator=(const Queue&);		//赋值运算符的重载定义

	bool enQueue(T);	//进队
	bool deQueue();		//出队

	T front()const;	//返回队首元素的值
	T back()const;	//返回队尾元素的值

	size_type size()const;		//此处使用前面定义的类型size_type
	bool isEmpty(void) const;	//判断队列是否为空
	bool isFull(void) const;	//判断队列是否已满

	void output(void)const;		//输出队列
private:
	struct node{
		T val;
		node *next;
	}*head, *rear;	//队列首尾元素指针

	//内存管理函数
	void copyLink(node *);	//复制已有链表
	void freeLink();		//释放已有链表所占空间
};
