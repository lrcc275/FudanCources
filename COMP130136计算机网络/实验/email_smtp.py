from socket import *
import datetime


def work():
    state = "s1"
    AddressBook = {}
    MessageSent = {}
    Drafts1 = []
    Drafts2 = []
    Drafts3 = []
    mailServer = "smtp.qq.com"
    fromAddress = input("your address: ")
    username = input("your username with Base64 code: ")  # 输入自己的用户名对应的编码
    password = input("Your password with Base64 code: ")  # 此处不是自己的密码，而是开启SMTP服务时对应的授权码

    print("the server is beginning to connect")
    serverPort = 25  # SMTP使用25号端口
    clientSocket = socket(AF_INET, SOCK_STREAM)
    clientSocket.connect((mailServer, serverPort))

    recv = clientSocket.recv(1024).decode()
    print(recv)
    if '220' != recv[:3]:
        print('220 reply not received from server.')

    # 开始与服务器的交互，服务器将返回状态码250,说明请求动作正确完成
    heloCommand = 'HELO Alice\r\n'
    clientSocket.send(heloCommand.encode())
    recv1 = clientSocket.recv(1024).decode()
    print(recv1)
    if '250' != recv1[:3]:
        print('250 reply not received from server.')

    # 发送"AUTH LOGIN"命令，验证身份.服务器将返回状态码334（服务器等待用户输入验证信息）
    clientSocket.sendall('AUTH LOGIN\r\n'.encode())
    recv2 = clientSocket.recv(1024).decode()
    print(recv2)
    if '334' != recv2[:3]:
        print('334 reply not received from server.')

    # 发送验证信息
    clientSocket.sendall((username + '\r\n').encode())
    recvName = clientSocket.recv(1024).decode()
    print(recvName)
    if '334' != recvName[:3]:
        print('334 reply not received from server')

    clientSocket.sendall((password + '\r\n').encode())
    recvPass = clientSocket.recv(1024).decode()
    print(recvPass)
    # 如果用户验证成功，服务器将返回状态码235
    if '235' != recvPass[:3]:
        print('235 reply not received from server')

    while state != "s0":
        if state == "s1":
            print("1: send message","2: address book","3: messages sent","4: drafts",sep="\n")
            options1 = input("Your choice is: ")
            match options1:
                case "1":
                    state = "s2"
                case "2":
                    state = "s3"
                case "3":
                    state = "s4"
                case "4":
                    state = "s5"
        elif state == "s2":
            #send messages
            Target1 = input("You will send to ? , splited by space: ")
            Target = Target1.split()
            Msg = input("Your content is: ")
            Msg = "\r\n " + Msg
            Subject = input("Your title is: ")
            endMsg = "\r\n.\r\n"
            wannakeep = input("Wanna keep to Drafts: yes or no: ")
            if wannakeep == "yes":
                Drafts1.append(Target1)
                Drafts2.append(Msg)
                Drafts3.append(Subject)
            else:
                for person in Target:
                    clientSocket.sendall(('MAIL FROM: <' + fromAddress + '>\r\n').encode())
                    recvFrom = clientSocket.recv(1024).decode()
                    print(recvFrom)
                    if '250' != recvFrom[:3]:
                        print('250 reply not received from server')

                    clientSocket.sendall(('RCPT TO: <' + person + '>\r\n').encode())
                    recvTo = clientSocket.recv(1024).decode()  # 注意UDP使用sendto，recvfrom
                    print(recvTo)
                    if '250' != recvTo[:3]:
                        print('250 reply not received from server')

                    # 发送 DATA 命令，表示即将发送邮件内容。服务器将返回状态码354（开始邮件输入，以"."结束）
                    clientSocket.send('DATA\r\n'.encode())
                    recvData = clientSocket.recv(1024).decode()
                    print(recvData)
                    if '354' != recvData[:3]:
                        print('354 reply not received from server')

                    contentType = "text/plain"

                    message = 'from:' + fromAddress + '\r\n'
                    message += 'to:' + person + '\r\n'
                    message += 'subject:' + Subject + '\r\n'
                    message += 'Content-Type:' + contentType + '\t\n'
                    message += '\r\n' + Msg
                    clientSocket.sendall(message.encode())

                    # 以"."结束。请求成功返回 250
                    clientSocket.sendall(endMsg.encode())
                    recvEnd = clientSocket.recv(1024).decode()
                    print(recvEnd)
                    if '250' != recvEnd[:3]:
                        print('250 reply not received from server')
                    time = datetime.datetime.now().time()
                    time = str(time)
                    MessageSent[person + " " + time] = " Tile  " + Subject + "  " "******" + "  content:" + Msg

            print("1: quit", "2: go to personal page", "3: send message", sep="\n")
            options2 = input("Your choice is: ")
            match options2:
                case "1":
                    state = "s0"
                case "2":
                    state = "s1"
                case "3":
                    state = "s2"

        elif state == "s3":
            for key,value in AddressBook.items():
                print("name: ",key,"address: ",value,sep="  ")

            while True:
                write = input("Do you wanna add, yes or no: ")
                if write == "yes":
                    name = input("name is: ")
                    address = input("address is: ")
                    AddressBook[name] = address
                else:
                    break
            send_message = input("wanna send message to your friends ?,if yes input their name; no, input quit  ")
            if send_message != "quit":
                person2 = send_message.split()
                Msg = input("Your content is: ")
                Msg = "\r\n " + Msg
                Subject = input("Your title is: ")
                endMsg = "\r\n.\r\n"

                wannakeep = input("Wanna keep to Drafts: yes or no: ")
                if wannakeep == "yes":
                    temp = ""
                    for name in send_message:
                        temp = temp + AddressBook[name] + " "
                    Drafts1.append(temp)
                    Drafts2.append(Msg)
                    Drafts3.append(Subject)
                else:
                    for person in person2:
                        person = AddressBook[person]
                        clientSocket.sendall(('MAIL FROM: <' + fromAddress + '>\r\n').encode())
                        recvFrom = clientSocket.recv(1024).decode()
                        print(recvFrom)
                        if '250' != recvFrom[:3]:
                            print('250 reply not received from server')
                        clientSocket.sendall(('RCPT TO: <' + person + '>\r\n').encode())
                        recvTo = clientSocket.recv(1024).decode()  # 注意UDP使用sendto，recvfrom
                        print(recvTo)
                        if '250' != recvTo[:3]:
                            print('250 reply not received from server')

                        # 发送 DATA 命令，表示即将发送邮件内容。服务器将返回状态码354（开始邮件输入，以"."结束）
                        clientSocket.send('DATA\r\n'.encode())
                        recvData = clientSocket.recv(1024).decode()
                        print(recvData)
                        if '354' != recvData[:3]:
                            print('354 reply not received from server')

                        contentType = "text/plain"

                        message = 'from:' + fromAddress + '\r\n'
                        message += 'to:' + person + '\r\n'
                        message += 'subject:' + Subject + '\r\n'
                        message += 'Content-Type:' + contentType + '\t\n'
                        message += '\r\n' + Msg
                        clientSocket.sendall(message.encode())

                        # 以"."结束。请求成功返回 250
                        clientSocket.sendall(endMsg.encode())
                        recvEnd = clientSocket.recv(1024).decode()
                        print(recvEnd)
                        if '250' != recvEnd[:3]:
                            print('250 reply not received from server')

                        time = datetime.datetime.now().time()
                        time = str(time)
                        MessageSent[person + " " + time] = " Tile  " + Subject + "  " "******" + "  content:" + Msg

            print("1: quit", "2: go to personal page", "3: keep in address book", sep="\n")
            options3 = input("Your choice is: ")
            match options3:
                case "1":
                    state = "s0"
                case "2":
                    state = "s1"
                case "3":
                    state = "s3"

        elif state == "s4":
            for key,value in MessageSent.items():
                print("Sent to ",key,"content is: ",value,sep="     ")
            print("1: quit", "2: go to personal page", "3: search messages sent", sep="\n")
            options2 = input("Your choice is: ")
            match options2:
                case "1":
                    state = "s0"
                case "2":
                    state = "s1"
                case "3":
                    state = "s4"

        elif state == "s5":
            for i in range(0,len(Drafts1)):
                print(i+1,"To: ",Drafts1[i]," ","Title: "," ",Drafts3[i]," ","Message: "," ",Drafts2[i])
            wannasend = input("Wanna send messages or quit, 0 is quit,or input tag of message: ")
            if wannasend != 0:
                wannasend = int(wannasend)
                print(wannasend)
                wannasend = wannasend - 1
                Target1 = Drafts1[wannasend]
                Target = Target1.split()
                Msg = Drafts3[wannasend]
                Subject = Drafts2[wannasend]
                Drafts1.pop(wannasend)
                Drafts2.pop(wannasend)
                Drafts3.pop(wannasend)
                endMsg = "\r\n.\r\n"
                for person in Target:
                    clientSocket.sendall(('MAIL FROM: <' + fromAddress + '>\r\n').encode())
                    recvFrom = clientSocket.recv(1024).decode()
                    print(recvFrom)
                    if '250' != recvFrom[:3]:
                        print('250 reply not received from server')
                    clientSocket.sendall(('RCPT TO: <' + person + '>\r\n').encode())
                    recvTo = clientSocket.recv(1024).decode()  # 注意UDP使用sendto，recvfrom
                    print(recvTo)
                    if '250' != recvTo[:3]:
                        print('250 reply not received from server')

                    # 发送 DATA 命令，表示即将发送邮件内容。服务器将返回状态码354（开始邮件输入，以"."结束）
                    clientSocket.send('DATA\r\n'.encode())
                    recvData = clientSocket.recv(1024).decode()
                    print(recvData)
                    if '354' != recvData[:3]:
                        print('354 reply not received from server')

                    contentType = "text/plain"

                    message = 'from:' + fromAddress + '\r\n'
                    message += 'to:' + person + '\r\n'
                    message += 'subject:' + Subject + '\r\n'
                    message += 'Content-Type:' + contentType + '\t\n'
                    message += '\r\n' + Msg
                    clientSocket.sendall(message.encode())

                    # 以"."结束。请求成功返回 250
                    clientSocket.sendall(endMsg.encode())
                    recvEnd = clientSocket.recv(1024).decode()
                    print(recvEnd)
                    if '250' != recvEnd[:3]:
                        print('250 reply not received from server')
                    time = datetime.datetime.now().time()
                    time = str(time)
                    MessageSent[person + " " + time] = " Tile  " + Subject + "  " "******" + "  content:" + Msg

            print("1: quit", "2: go to personal page", "3: stay in draft", sep="\n")
            options2 = input("Your choice is: ")
            match options2:
                case "1":
                    state = "s0"
                case "2":
                    state = "s1"
                case "3":
                    state = "s5"
        else:
            break
    return

work()