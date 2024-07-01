
./bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 2a 2f 00 00    	pushq  0x2f2a(%rip)        # 3f50 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 2b 2f 00 00 	bnd jmpq *0x2f2b(%rip)        # 3f58 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	pushq  $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmpq 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	pushq  $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmpq 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	pushq  $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmpq 1020 <.plt>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	pushq  $0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmpq 1020 <.plt>
    110f:	90                   	nop

Disassembly of section .plt.got:

0000000000001110 <__cxa_finalize@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 b5 2e 00 00 	bnd jmpq *0x2eb5(%rip)        # 3fd0 <__cxa_finalize@GLIBC_2.2.5>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001120 <__printf_chk@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 35 2e 00 00 	bnd jmpq *0x2e35(%rip)        # 3f60 <__printf_chk@GLIBC_2.3.4>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 2d 2e 00 00 	bnd jmpq *0x2e2d(%rip)        # 3f68 <_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_@GLIBCXX_3.4>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 25 2e 00 00 	bnd jmpq *0x2e25(%rip)        # 3f70 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <_ZNSirsERl@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 1d 2e 00 00 	bnd jmpq *0x2e1d(%rip)        # 3f78 <_ZNSirsERl@GLIBCXX_3.4>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <__cxa_atexit@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 15 2e 00 00 	bnd jmpq *0x2e15(%rip)        # 3f80 <__cxa_atexit@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <__isoc99_sscanf@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 0d 2e 00 00 	bnd jmpq *0x2e0d(%rip)        # 3f88 <__isoc99_sscanf@GLIBC_2.7>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 05 2e 00 00 	bnd jmpq *0x2e05(%rip)        # 3f90 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001190 <_ZNSi10_M_extractIlEERSiRT_@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 fd 2d 00 00 	bnd jmpq *0x2dfd(%rip)        # 3f98 <_ZNSi10_M_extractIlEERSiRT_@GLIBCXX_3.4.9>
    119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011a0 <__stack_chk_fail@plt>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	f2 ff 25 f5 2d 00 00 	bnd jmpq *0x2df5(%rip)        # 3fa0 <__stack_chk_fail@GLIBC_2.4>
    11ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011b0 <__isoc99_scanf@plt>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	f2 ff 25 ed 2d 00 00 	bnd jmpq *0x2ded(%rip)        # 3fa8 <__isoc99_scanf@GLIBC_2.7>
    11bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011c0 <exit@plt>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	f2 ff 25 e5 2d 00 00 	bnd jmpq *0x2de5(%rip)        # 3fb0 <exit@GLIBC_2.2.5>
    11cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011d0 <getchar@plt>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	f2 ff 25 dd 2d 00 00 	bnd jmpq *0x2ddd(%rip)        # 3fb8 <getchar@GLIBC_2.2.5>
    11db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011e0 <_ZNSt8ios_base4InitC1Ev@plt>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	f2 ff 25 d5 2d 00 00 	bnd jmpq *0x2dd5(%rip)        # 3fc0 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    11eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011f0 <puts@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 cd 2d 00 00 	bnd jmpq *0x2dcd(%rip)        # 3fc8 <puts@GLIBC_2.2.5>
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001200 <main>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	41 54                	push   %r12
    1206:	48 8d 35 cb 0e 00 00 	lea    0xecb(%rip),%rsi        # 20d8 <_IO_stdin_used+0xd8>
    120d:	48 8d 3d 2c 33 00 00 	lea    0x332c(%rip),%rdi        # 4540 <_ZSt4cout@@GLIBCXX_3.4>
    1214:	55                   	push   %rbp
    1215:	48 81 ec 48 03 00 00 	sub    $0x348,%rsp
    121c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1223:	00 00 
    1225:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
    122c:	00 
    122d:	31 c0                	xor    %eax,%eax
    122f:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
    1234:	49 89 e4             	mov    %rsp,%r12
    1237:	e8 44 ff ff ff       	callq  1180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    123c:	48 89 c7             	mov    %rax,%rdi
    123f:	e8 fc fe ff ff       	callq  1140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    1244:	48 89 ef             	mov    %rbp,%rdi
    1247:	e8 cc 07 00 00       	callq  1a18 <_Z9read_linePc>
    124c:	48 89 ef             	mov    %rbp,%rdi
    124f:	e8 be 08 00 00       	callq  1b12 <_Z7phase_1Pc>
    1254:	48 8d 35 c0 0e 00 00 	lea    0xec0(%rip),%rsi        # 211b <_IO_stdin_used+0x11b>
    125b:	48 8d 3d de 32 00 00 	lea    0x32de(%rip),%rdi        # 4540 <_ZSt4cout@@GLIBCXX_3.4>
    1262:	e8 19 ff ff ff       	callq  1180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1267:	48 89 c7             	mov    %rax,%rdi
    126a:	e8 d1 fe ff ff       	callq  1140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    126f:	48 89 ef             	mov    %rbp,%rdi
    1272:	e8 a1 07 00 00       	callq  1a18 <_Z9read_linePc>
    1277:	48 89 ef             	mov    %rbp,%rdi
    127a:	e8 b9 08 00 00       	callq  1b38 <_Z7phase_2Pc>
    127f:	48 8d 35 be 0e 00 00 	lea    0xebe(%rip),%rsi        # 2144 <_IO_stdin_used+0x144>
    1286:	48 8d 3d b3 32 00 00 	lea    0x32b3(%rip),%rdi        # 4540 <_ZSt4cout@@GLIBCXX_3.4>
    128d:	e8 ee fe ff ff       	callq  1180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1292:	48 89 c7             	mov    %rax,%rdi
    1295:	e8 a6 fe ff ff       	callq  1140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    129a:	48 89 ef             	mov    %rbp,%rdi
    129d:	e8 76 07 00 00       	callq  1a18 <_Z9read_linePc>
    12a2:	48 89 ef             	mov    %rbp,%rdi
    12a5:	e8 ca 08 00 00       	callq  1b74 <_Z7phase_3Pc>
    12aa:	48 8d 35 b1 0e 00 00 	lea    0xeb1(%rip),%rsi        # 2162 <_IO_stdin_used+0x162>
    12b1:	48 8d 3d 88 32 00 00 	lea    0x3288(%rip),%rdi        # 4540 <_ZSt4cout@@GLIBCXX_3.4>
    12b8:	e8 c3 fe ff ff       	callq  1180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    12bd:	48 89 c7             	mov    %rax,%rdi
    12c0:	e8 7b fe ff ff       	callq  1140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    12c5:	4c 89 e6             	mov    %r12,%rsi
    12c8:	48 8d 3d 91 33 00 00 	lea    0x3391(%rip),%rdi        # 4660 <_ZSt3cin@@GLIBCXX_3.4>
    12cf:	e8 7c fe ff ff       	callq  1150 <_ZNSirsERl@plt>
    12d4:	48 8b 3c 24          	mov    (%rsp),%rdi
    12d8:	e8 59 09 00 00       	callq  1c36 <_Z7phase_4l>
    12dd:	48 8d 35 8d 0e 00 00 	lea    0xe8d(%rip),%rsi        # 2171 <_IO_stdin_used+0x171>
    12e4:	48 8d 3d 55 32 00 00 	lea    0x3255(%rip),%rdi        # 4540 <_ZSt4cout@@GLIBCXX_3.4>
    12eb:	e8 90 fe ff ff       	callq  1180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    12f0:	48 89 c7             	mov    %rax,%rdi
    12f3:	e8 48 fe ff ff       	callq  1140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    12f8:	4c 89 e6             	mov    %r12,%rsi
    12fb:	48 8d 3d 5e 33 00 00 	lea    0x335e(%rip),%rdi        # 4660 <_ZSt3cin@@GLIBCXX_3.4>
    1302:	e8 89 fe ff ff       	callq  1190 <_ZNSi10_M_extractIlEERSiRT_@plt>
    1307:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    130c:	48 89 c7             	mov    %rax,%rdi
    130f:	e8 7c fe ff ff       	callq  1190 <_ZNSi10_M_extractIlEERSiRT_@plt>
    1314:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    1319:	48 89 c7             	mov    %rax,%rdi
    131c:	e8 2f fe ff ff       	callq  1150 <_ZNSirsERl@plt>
    1321:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    1326:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    132b:	48 8b 3c 24          	mov    (%rsp),%rdi
    132f:	e8 30 09 00 00       	callq  1c64 <_Z7phase_5lll>
    1334:	48 8d 35 5a 0e 00 00 	lea    0xe5a(%rip),%rsi        # 2195 <_IO_stdin_used+0x195>
    133b:	48 8d 3d fe 31 00 00 	lea    0x31fe(%rip),%rdi        # 4540 <_ZSt4cout@@GLIBCXX_3.4>
    1342:	e8 39 fe ff ff       	callq  1180 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1347:	48 89 c7             	mov    %rax,%rdi
    134a:	e8 f1 fd ff ff       	callq  1140 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    134f:	48 89 ee             	mov    %rbp,%rsi
    1352:	48 8d 3d 07 33 00 00 	lea    0x3307(%rip),%rdi        # 4660 <_ZSt3cin@@GLIBCXX_3.4>
    1359:	e8 d2 fd ff ff       	callq  1130 <_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_@plt>
    135e:	48 89 ef             	mov    %rbp,%rdi
    1361:	e8 a4 09 00 00       	callq  1d0a <_Z7phase_6Pc>
    1366:	e8 33 0a 00 00       	callq  1d9e <_Z15congratulationsv>
    136b:	48 8b 84 24 38 03 00 	mov    0x338(%rsp),%rax
    1372:	00 
    1373:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    137a:	00 00 
    137c:	74 05                	je     1383 <main+0x183>
    137e:	e8 1d fe ff ff       	callq  11a0 <__stack_chk_fail@plt>
    1383:	48 81 c4 48 03 00 00 	add    $0x348,%rsp
    138a:	31 c0                	xor    %eax,%eax
    138c:	5d                   	pop    %rbp
    138d:	41 5c                	pop    %r12
    138f:	c3                   	retq   

0000000000001390 <_GLOBAL__sub_I__ZN8baselock7acquireEi>:
    1390:	f3 0f 1e fa          	endbr64 
    1394:	50                   	push   %rax
    1395:	48 8d 3d e4 35 00 00 	lea    0x35e4(%rip),%rdi        # 4980 <_ZStL8__ioinit>
    139c:	e8 3f fe ff ff       	callq  11e0 <_ZNSt8ios_base4InitC1Ev@plt>
    13a1:	48 8b 3d 50 2c 00 00 	mov    0x2c50(%rip),%rdi        # 3ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    13a8:	59                   	pop    %rcx
    13a9:	48 8d 15 58 2c 00 00 	lea    0x2c58(%rip),%rdx        # 4008 <__dso_handle>
    13b0:	48 8d 35 c9 35 00 00 	lea    0x35c9(%rip),%rsi        # 4980 <_ZStL8__ioinit>
    13b7:	e9 a4 fd ff ff       	jmpq   1160 <__cxa_atexit@plt>
    13bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000013c0 <_start>:
    13c0:	f3 0f 1e fa          	endbr64 
    13c4:	31 ed                	xor    %ebp,%ebp
    13c6:	49 89 d1             	mov    %rdx,%r9
    13c9:	5e                   	pop    %rsi
    13ca:	48 89 e2             	mov    %rsp,%rdx
    13cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    13d1:	50                   	push   %rax
    13d2:	54                   	push   %rsp
    13d3:	4c 8d 05 06 0b 00 00 	lea    0xb06(%rip),%r8        # 1ee0 <__libc_csu_fini>
    13da:	48 8d 0d 8f 0a 00 00 	lea    0xa8f(%rip),%rcx        # 1e70 <__libc_csu_init>
    13e1:	48 8d 3d 18 fe ff ff 	lea    -0x1e8(%rip),%rdi        # 1200 <main>
    13e8:	ff 15 f2 2b 00 00    	callq  *0x2bf2(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    13ee:	f4                   	hlt    
    13ef:	90                   	nop

00000000000013f0 <deregister_tm_clones>:
    13f0:	48 8d 3d 31 31 00 00 	lea    0x3131(%rip),%rdi        # 4528 <__TMC_END__>
    13f7:	48 8d 05 2a 31 00 00 	lea    0x312a(%rip),%rax        # 4528 <__TMC_END__>
    13fe:	48 39 f8             	cmp    %rdi,%rax
    1401:	74 15                	je     1418 <deregister_tm_clones+0x28>
    1403:	48 8b 05 ce 2b 00 00 	mov    0x2bce(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    140a:	48 85 c0             	test   %rax,%rax
    140d:	74 09                	je     1418 <deregister_tm_clones+0x28>
    140f:	ff e0                	jmpq   *%rax
    1411:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1418:	c3                   	retq   
    1419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001420 <register_tm_clones>:
    1420:	48 8d 3d 01 31 00 00 	lea    0x3101(%rip),%rdi        # 4528 <__TMC_END__>
    1427:	48 8d 35 fa 30 00 00 	lea    0x30fa(%rip),%rsi        # 4528 <__TMC_END__>
    142e:	48 29 fe             	sub    %rdi,%rsi
    1431:	48 89 f0             	mov    %rsi,%rax
    1434:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1438:	48 c1 f8 03          	sar    $0x3,%rax
    143c:	48 01 c6             	add    %rax,%rsi
    143f:	48 d1 fe             	sar    %rsi
    1442:	74 14                	je     1458 <register_tm_clones+0x38>
    1444:	48 8b 05 a5 2b 00 00 	mov    0x2ba5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    144b:	48 85 c0             	test   %rax,%rax
    144e:	74 08                	je     1458 <register_tm_clones+0x38>
    1450:	ff e0                	jmpq   *%rax
    1452:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1458:	c3                   	retq   
    1459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001460 <__do_global_dtors_aux>:
    1460:	f3 0f 1e fa          	endbr64 
    1464:	80 3d 0d 33 00 00 00 	cmpb   $0x0,0x330d(%rip)        # 4778 <completed.8061>
    146b:	75 2b                	jne    1498 <__do_global_dtors_aux+0x38>
    146d:	55                   	push   %rbp
    146e:	48 83 3d 5a 2b 00 00 	cmpq   $0x0,0x2b5a(%rip)        # 3fd0 <__cxa_finalize@GLIBC_2.2.5>
    1475:	00 
    1476:	48 89 e5             	mov    %rsp,%rbp
    1479:	74 0c                	je     1487 <__do_global_dtors_aux+0x27>
    147b:	48 8b 3d 86 2b 00 00 	mov    0x2b86(%rip),%rdi        # 4008 <__dso_handle>
    1482:	e8 89 fc ff ff       	callq  1110 <__cxa_finalize@plt>
    1487:	e8 64 ff ff ff       	callq  13f0 <deregister_tm_clones>
    148c:	c6 05 e5 32 00 00 01 	movb   $0x1,0x32e5(%rip)        # 4778 <completed.8061>
    1493:	5d                   	pop    %rbp
    1494:	c3                   	retq   
    1495:	0f 1f 00             	nopl   (%rax)
    1498:	c3                   	retq   
    1499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014a0 <frame_dummy>:
    14a0:	f3 0f 1e fa          	endbr64 
    14a4:	e9 77 ff ff ff       	jmpq   1420 <register_tm_clones>
    14a9:	90                   	nop

00000000000014aa <_ZN8baselock7releaseEii>:
    14aa:	f3 0f 1e fa          	endbr64 
    14ae:	55                   	push   %rbp
    14af:	89 d5                	mov    %edx,%ebp
    14b1:	53                   	push   %rbx
    14b2:	48 89 fb             	mov    %rdi,%rbx
    14b5:	51                   	push   %rcx
    14b6:	48 8b 07             	mov    (%rdi),%rax
    14b9:	ff 50 10             	callq  *0x10(%rax)
    14bc:	81 fd f0 0f 00 00    	cmp    $0xff0,%ebp
    14c2:	75 15                	jne    14d9 <_ZN8baselock7releaseEii+0x2f>
    14c4:	fe c8                	dec    %al
    14c6:	75 11                	jne    14d9 <_ZN8baselock7releaseEii+0x2f>
    14c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    14cd:	48 c1 e0 20          	shl    $0x20,%rax
    14d1:	48 89 43 08          	mov    %rax,0x8(%rbx)
    14d5:	b0 01                	mov    $0x1,%al
    14d7:	eb 02                	jmp    14db <_ZN8baselock7releaseEii+0x31>
    14d9:	31 c0                	xor    %eax,%eax
    14db:	5a                   	pop    %rdx
    14dc:	5b                   	pop    %rbx
    14dd:	5d                   	pop    %rbp
    14de:	c3                   	retq   
    14df:	90                   	nop

00000000000014e0 <_ZN5lock17releaseEii>:
    14e0:	f3 0f 1e fa          	endbr64 
    14e4:	55                   	push   %rbp
    14e5:	89 d5                	mov    %edx,%ebp
    14e7:	53                   	push   %rbx
    14e8:	48 89 fb             	mov    %rdi,%rbx
    14eb:	51                   	push   %rcx
    14ec:	48 8b 07             	mov    (%rdi),%rax
    14ef:	ff 50 10             	callq  *0x10(%rax)
    14f2:	81 fd 00 0f 00 00    	cmp    $0xf00,%ebp
    14f8:	75 15                	jne    150f <_ZN5lock17releaseEii+0x2f>
    14fa:	fe c8                	dec    %al
    14fc:	75 11                	jne    150f <_ZN5lock17releaseEii+0x2f>
    14fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1503:	48 c1 e0 20          	shl    $0x20,%rax
    1507:	48 89 43 08          	mov    %rax,0x8(%rbx)
    150b:	b0 01                	mov    $0x1,%al
    150d:	eb 02                	jmp    1511 <_ZN5lock17releaseEii+0x31>
    150f:	31 c0                	xor    %eax,%eax
    1511:	5a                   	pop    %rdx
    1512:	5b                   	pop    %rbx
    1513:	5d                   	pop    %rbp
    1514:	c3                   	retq   
    1515:	90                   	nop

0000000000001516 <_ZN5lock27releaseEii>:
    1516:	f3 0f 1e fa          	endbr64 
    151a:	55                   	push   %rbp
    151b:	89 d5                	mov    %edx,%ebp
    151d:	53                   	push   %rbx
    151e:	48 89 fb             	mov    %rdi,%rbx
    1521:	51                   	push   %rcx
    1522:	48 8b 07             	mov    (%rdi),%rax
    1525:	ff 50 10             	callq  *0x10(%rax)
    1528:	83 fd 0f             	cmp    $0xf,%ebp
    152b:	75 15                	jne    1542 <_ZN5lock27releaseEii+0x2c>
    152d:	fe c8                	dec    %al
    152f:	75 11                	jne    1542 <_ZN5lock27releaseEii+0x2c>
    1531:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1536:	48 c1 e0 20          	shl    $0x20,%rax
    153a:	48 89 43 08          	mov    %rax,0x8(%rbx)
    153e:	b0 01                	mov    $0x1,%al
    1540:	eb 02                	jmp    1544 <_ZN5lock27releaseEii+0x2e>
    1542:	31 c0                	xor    %eax,%eax
    1544:	5a                   	pop    %rdx
    1545:	5b                   	pop    %rbx
    1546:	5d                   	pop    %rbp
    1547:	c3                   	retq   

0000000000001548 <_ZL4hopei>:
    1548:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    154e:	85 ff                	test   %edi,%edi
    1550:	74 23                	je     1575 <_ZL4hopei+0x2d>
    1552:	53                   	push   %rbx
    1553:	89 fb                	mov    %edi,%ebx
    1555:	d1 ff                	sar    %edi
    1557:	e8 ec ff ff ff       	callq  1548 <_ZL4hopei>
    155c:	41 89 c0             	mov    %eax,%r8d
    155f:	44 0f af c0          	imul   %eax,%r8d
    1563:	80 e3 01             	and    $0x1,%bl
    1566:	74 08                	je     1570 <_ZL4hopei+0x28>
    1568:	46 8d 04 85 00 00 00 	lea    0x0(,%r8,4),%r8d
    156f:	00 
    1570:	44 89 c0             	mov    %r8d,%eax
    1573:	5b                   	pop    %rbx
    1574:	c3                   	retq   
    1575:	44 89 c0             	mov    %r8d,%eax
    1578:	c3                   	retq   
    1579:	90                   	nop

000000000000157a <_ZN8baselock7acquireEi>:
    157a:	f3 0f 1e fa          	endbr64 
    157e:	55                   	push   %rbp
    157f:	89 f5                	mov    %esi,%ebp
    1581:	53                   	push   %rbx
    1582:	48 89 fb             	mov    %rdi,%rbx
    1585:	51                   	push   %rcx
    1586:	48 8b 07             	mov    (%rdi),%rax
    1589:	ff 50 10             	callq  *0x10(%rax)
    158c:	41 89 c0             	mov    %eax,%r8d
    158f:	31 c0                	xor    %eax,%eax
    1591:	45 84 c0             	test   %r8b,%r8b
    1594:	75 20                	jne    15b6 <_ZN8baselock7acquireEi+0x3c>
    1596:	ba 01 00 00 00       	mov    $0x1,%edx
    159b:	89 d0                	mov    %edx,%eax
    159d:	f0 87 43 08          	lock xchg %eax,0x8(%rbx)
    15a1:	85 c0                	test   %eax,%eax
    15a3:	75 f6                	jne    159b <_ZN8baselock7acquireEi+0x21>
    15a5:	48 8b 03             	mov    (%rbx),%rax
    15a8:	48 89 df             	mov    %rbx,%rdi
    15ab:	ff 50 18             	callq  *0x18(%rax)
    15ae:	89 6b 0c             	mov    %ebp,0xc(%rbx)
    15b1:	b8 f0 0f 00 00       	mov    $0xff0,%eax
    15b6:	5a                   	pop    %rdx
    15b7:	5b                   	pop    %rbx
    15b8:	5d                   	pop    %rbp
    15b9:	c3                   	retq   

00000000000015ba <_ZN5lock17acquireEi>:
    15ba:	f3 0f 1e fa          	endbr64 
    15be:	55                   	push   %rbp
    15bf:	89 f5                	mov    %esi,%ebp
    15c1:	53                   	push   %rbx
    15c2:	48 89 fb             	mov    %rdi,%rbx
    15c5:	51                   	push   %rcx
    15c6:	48 8b 07             	mov    (%rdi),%rax
    15c9:	ff 50 10             	callq  *0x10(%rax)
    15cc:	41 89 c0             	mov    %eax,%r8d
    15cf:	31 c0                	xor    %eax,%eax
    15d1:	45 84 c0             	test   %r8b,%r8b
    15d4:	75 20                	jne    15f6 <_ZN5lock17acquireEi+0x3c>
    15d6:	ba 01 00 00 00       	mov    $0x1,%edx
    15db:	89 d0                	mov    %edx,%eax
    15dd:	f0 87 43 08          	lock xchg %eax,0x8(%rbx)
    15e1:	85 c0                	test   %eax,%eax
    15e3:	75 f6                	jne    15db <_ZN5lock17acquireEi+0x21>
    15e5:	48 8b 03             	mov    (%rbx),%rax
    15e8:	48 89 df             	mov    %rbx,%rdi
    15eb:	ff 50 18             	callq  *0x18(%rax)
    15ee:	89 6b 0c             	mov    %ebp,0xc(%rbx)
    15f1:	b8 00 0f 00 00       	mov    $0xf00,%eax
    15f6:	5a                   	pop    %rdx
    15f7:	5b                   	pop    %rbx
    15f8:	5d                   	pop    %rbp
    15f9:	c3                   	retq   

00000000000015fa <_ZN5lock27acquireEi>:
    15fa:	f3 0f 1e fa          	endbr64 
    15fe:	55                   	push   %rbp
    15ff:	89 f5                	mov    %esi,%ebp
    1601:	53                   	push   %rbx
    1602:	48 89 fb             	mov    %rdi,%rbx
    1605:	51                   	push   %rcx
    1606:	48 8b 07             	mov    (%rdi),%rax
    1609:	ff 50 10             	callq  *0x10(%rax)
    160c:	41 89 c0             	mov    %eax,%r8d
    160f:	31 c0                	xor    %eax,%eax
    1611:	45 84 c0             	test   %r8b,%r8b
    1614:	75 20                	jne    1636 <_ZN5lock27acquireEi+0x3c>
    1616:	ba 01 00 00 00       	mov    $0x1,%edx
    161b:	89 d0                	mov    %edx,%eax
    161d:	f0 87 43 08          	lock xchg %eax,0x8(%rbx)
    1621:	85 c0                	test   %eax,%eax
    1623:	75 f6                	jne    161b <_ZN5lock27acquireEi+0x21>
    1625:	48 8b 03             	mov    (%rbx),%rax
    1628:	48 89 df             	mov    %rbx,%rdi
    162b:	ff 50 18             	callq  *0x18(%rax)
    162e:	89 6b 0c             	mov    %ebp,0xc(%rbx)
    1631:	b8 0f 00 00 00       	mov    $0xf,%eax
    1636:	5a                   	pop    %rdx
    1637:	5b                   	pop    %rbx
    1638:	5d                   	pop    %rbp
    1639:	c3                   	retq   

000000000000163a <_Z8is_digitc>:
    163a:	f3 0f 1e fa          	endbr64 
    163e:	83 ef 30             	sub    $0x30,%edi
    1641:	40 80 ff 09          	cmp    $0x9,%dil
    1645:	0f 96 c0             	setbe  %al
    1648:	c3                   	retq   

0000000000001649 <_Z5is_opc>:
    1649:	f3 0f 1e fa          	endbr64 
    164d:	8d 57 d5             	lea    -0x2b(%rdi),%edx
    1650:	b0 01                	mov    $0x1,%al
    1652:	80 e2 fd             	and    $0xfd,%dl
    1655:	74 10                	je     1667 <_Z5is_opc+0x1e>
    1657:	40 80 ff 2a          	cmp    $0x2a,%dil
    165b:	0f 94 c0             	sete   %al
    165e:	40 80 ff 2f          	cmp    $0x2f,%dil
    1662:	0f 94 c2             	sete   %dl
    1665:	09 d0                	or     %edx,%eax
    1667:	c3                   	retq   

0000000000001668 <_Z8priorityc>:
    1668:	f3 0f 1e fa          	endbr64 
    166c:	8d 57 d5             	lea    -0x2b(%rdi),%edx
    166f:	b8 01 00 00 00       	mov    $0x1,%eax
    1674:	80 e2 fd             	and    $0xfd,%dl
    1677:	74 14                	je     168d <_Z8priorityc+0x25>
    1679:	40 80 ff 2a          	cmp    $0x2a,%dil
    167d:	74 09                	je     1688 <_Z8priorityc+0x20>
    167f:	40 80 ff 2f          	cmp    $0x2f,%dil
    1683:	74 03                	je     1688 <_Z8priorityc+0x20>
    1685:	31 c0                	xor    %eax,%eax
    1687:	c3                   	retq   
    1688:	b8 02 00 00 00       	mov    $0x2,%eax
    168d:	c3                   	retq   

000000000000168e <_Z28build_answer_expression_treev>:
    168e:	f3 0f 1e fa          	endbr64 
    1692:	48 8d 05 6b 2d 00 00 	lea    0x2d6b(%rip),%rax        # 4404 <ans+0x84>
    1699:	c3                   	retq   

000000000000169a <_Z11attach_nodePiS_>:
    169a:	f3 0f 1e fa          	endbr64 
    169e:	48 63 0f             	movslq (%rdi),%rcx
    16a1:	4c 8d 0d 58 32 00 00 	lea    0x3258(%rip),%r9        # 4900 <op_stack>
    16a8:	44 8b 06             	mov    (%rsi),%r8d
    16ab:	41 55                	push   %r13
    16ad:	48 63 15 6c 2e 00 00 	movslq 0x2e6c(%rip),%rdx        # 4520 <cand_node_idx>
    16b4:	41 54                	push   %r12
    16b6:	48 8d 05 c3 30 00 00 	lea    0x30c3(%rip),%rax        # 4780 <cand>
    16bd:	4c 8d 15 5c 32 00 00 	lea    0x325c(%rip),%r10        # 4920 <flag_stack>
    16c4:	55                   	push   %rbp
    16c5:	49 89 cb             	mov    %rcx,%r11
    16c8:	48 6b ea 0c          	imul   $0xc,%rdx,%rbp
    16cc:	53                   	push   %rbx
    16cd:	41 8a 0c 09          	mov    (%r9,%rcx,1),%cl
    16d1:	41 ff cb             	dec    %r11d
    16d4:	4c 8d 0d 65 32 00 00 	lea    0x3265(%rip),%r9        # 4940 <digit_stack>
    16db:	48 89 d3             	mov    %rdx,%rbx
    16de:	48 01 c5             	add    %rax,%rbp
    16e1:	88 4d 00             	mov    %cl,0x0(%rbp)
    16e4:	49 63 c8             	movslq %r8d,%rcx
    16e7:	41 80 3c 0a 00       	cmpb   $0x0,(%r10,%rcx,1)
    16ec:	45 0f be 24 09       	movsbl (%r9,%rcx,1),%r12d
    16f1:	74 0b                	je     16fe <_Z11attach_nodePiS_+0x64>
    16f3:	44 89 65 04          	mov    %r12d,0x4(%rbp)
    16f7:	bd 01 00 00 00       	mov    $0x1,%ebp
    16fc:	eb 16                	jmp    1714 <_Z11attach_nodePiS_+0x7a>
    16fe:	8d 4a 01             	lea    0x1(%rdx),%ecx
    1701:	89 4d 04             	mov    %ecx,0x4(%rbp)
    1704:	48 63 c9             	movslq %ecx,%rcx
    1707:	bd 02 00 00 00       	mov    $0x2,%ebp
    170c:	48 6b c9 0c          	imul   $0xc,%rcx,%rcx
    1710:	44 88 24 08          	mov    %r12b,(%rax,%rcx,1)
    1714:	41 ff c8             	dec    %r8d
    1717:	4d 63 e0             	movslq %r8d,%r12
    171a:	43 80 3c 22 00       	cmpb   $0x0,(%r10,%r12,1)
    171f:	47 0f be 2c 21       	movsbl (%r9,%r12,1),%r13d
    1724:	74 0b                	je     1731 <_Z11attach_nodePiS_+0x97>
    1726:	48 6b d2 0c          	imul   $0xc,%rdx,%rdx
    172a:	44 89 6c 10 08       	mov    %r13d,0x8(%rax,%rdx,1)
    172f:	eb 18                	jmp    1749 <_Z11attach_nodePiS_+0xaf>
    1731:	48 6b d2 0c          	imul   $0xc,%rdx,%rdx
    1735:	8d 4b 02             	lea    0x2(%rbx),%ecx
    1738:	ff c5                	inc    %ebp
    173a:	89 4c 10 08          	mov    %ecx,0x8(%rax,%rdx,1)
    173e:	48 63 c9             	movslq %ecx,%rcx
    1741:	48 6b c9 0c          	imul   $0xc,%rcx,%rcx
    1745:	44 88 2c 08          	mov    %r13b,(%rax,%rcx,1)
    1749:	43 88 1c 21          	mov    %bl,(%r9,%r12,1)
    174d:	5b                   	pop    %rbx
    174e:	43 c6 04 22 01       	movb   $0x1,(%r10,%r12,1)
    1753:	44 89 1f             	mov    %r11d,(%rdi)
    1756:	44 89 06             	mov    %r8d,(%rsi)
    1759:	01 2d c1 2d 00 00    	add    %ebp,0x2dc1(%rip)        # 4520 <cand_node_idx>
    175f:	5d                   	pop    %rbp
    1760:	41 5c                	pop    %r12
    1762:	41 5d                	pop    %r13
    1764:	c3                   	retq   

0000000000001765 <_Z31build_candidate_expression_treePci>:
    1765:	f3 0f 1e fa          	endbr64 
    1769:	41 56                	push   %r14
    176b:	48 8d 15 ef 31 00 00 	lea    0x31ef(%rip),%rdx        # 4961 <cand_stack+0x1>
    1772:	41 55                	push   %r13
    1774:	41 54                	push   %r12
    1776:	55                   	push   %rbp
    1777:	53                   	push   %rbx
    1778:	48 83 ec 10          	sub    $0x10,%rsp
    177c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1783:	00 00 
    1785:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    178a:	31 c0                	xor    %eax,%eax
    178c:	c7 04 24 00 00 00 00 	movl   $0x0,(%rsp)
    1793:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%rsp)
    179a:	00 
    179b:	c7 05 7b 2d 00 00 01 	movl   $0x1,0x2d7b(%rip)        # 4520 <cand_node_idx>
    17a2:	00 00 00 
    17a5:	39 c6                	cmp    %eax,%esi
    17a7:	7f 16                	jg     17bf <_Z31build_candidate_expression_treePci+0x5a>
    17a9:	bb 00 00 00 00       	mov    $0x0,%ebx
    17ae:	85 f6                	test   %esi,%esi
    17b0:	48 8d 2d a9 31 00 00 	lea    0x31a9(%rip),%rbp        # 4960 <cand_stack>
    17b7:	0f 48 f3             	cmovs  %ebx,%esi
    17ba:	48 63 de             	movslq %esi,%rbx
    17bd:	eb 3d                	jmp    17fc <_Z31build_candidate_expression_treePci+0x97>
    17bf:	8a 0c 07             	mov    (%rdi,%rax,1),%cl
    17c2:	48 ff c0             	inc    %rax
    17c5:	88 4c 10 ff          	mov    %cl,-0x1(%rax,%rdx,1)
    17c9:	eb da                	jmp    17a5 <_Z31build_candidate_expression_treePci+0x40>
    17cb:	44 8a 64 1d 00       	mov    0x0(%rbp,%rbx,1),%r12b
    17d0:	41 8d 44 24 d0       	lea    -0x30(%r12),%eax
    17d5:	3c 09                	cmp    $0x9,%al
    17d7:	77 2f                	ja     1808 <_Z31build_candidate_expression_treePci+0xa3>
    17d9:	8b 04 24             	mov    (%rsp),%eax
    17dc:	48 8d 15 5d 31 00 00 	lea    0x315d(%rip),%rdx        # 4940 <digit_stack>
    17e3:	ff c0                	inc    %eax
    17e5:	89 04 24             	mov    %eax,(%rsp)
    17e8:	48 98                	cltq   
    17ea:	44 88 24 02          	mov    %r12b,(%rdx,%rax,1)
    17ee:	48 8d 15 2b 31 00 00 	lea    0x312b(%rip),%rdx        # 4920 <flag_stack>
    17f5:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    17f9:	48 ff cb             	dec    %rbx
    17fc:	85 db                	test   %ebx,%ebx
    17fe:	7f cb                	jg     17cb <_Z31build_candidate_expression_treePci+0x66>
    1800:	48 89 e6             	mov    %rsp,%rsi
    1803:	e9 c7 00 00 00       	jmpq   18cf <_Z31build_candidate_expression_treePci+0x16a>
    1808:	41 80 fc 29          	cmp    $0x29,%r12b
    180c:	75 19                	jne    1827 <_Z31build_candidate_expression_treePci+0xc2>
    180e:	8b 44 24 04          	mov    0x4(%rsp),%eax
    1812:	48 8d 15 e7 30 00 00 	lea    0x30e7(%rip),%rdx        # 4900 <op_stack>
    1819:	ff c0                	inc    %eax
    181b:	89 44 24 04          	mov    %eax,0x4(%rsp)
    181f:	48 98                	cltq   
    1821:	c6 04 02 29          	movb   $0x29,(%rdx,%rax,1)
    1825:	eb d2                	jmp    17f9 <_Z31build_candidate_expression_treePci+0x94>
    1827:	41 80 fc 28          	cmp    $0x28,%r12b
    182b:	75 2d                	jne    185a <_Z31build_candidate_expression_treePci+0xf5>
    182d:	4c 8d 25 cc 30 00 00 	lea    0x30cc(%rip),%r12        # 4900 <op_stack>
    1834:	48 63 54 24 04       	movslq 0x4(%rsp),%rdx
    1839:	41 80 3c 14 29       	cmpb   $0x29,(%r12,%rdx,1)
    183e:	48 89 d0             	mov    %rdx,%rax
    1841:	74 0f                	je     1852 <_Z31build_candidate_expression_treePci+0xed>
    1843:	48 89 e6             	mov    %rsp,%rsi
    1846:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    184b:	e8 4a fe ff ff       	callq  169a <_Z11attach_nodePiS_>
    1850:	eb e2                	jmp    1834 <_Z31build_candidate_expression_treePci+0xcf>
    1852:	ff c8                	dec    %eax
    1854:	89 44 24 04          	mov    %eax,0x4(%rsp)
    1858:	eb 9f                	jmp    17f9 <_Z31build_candidate_expression_treePci+0x94>
    185a:	45 0f be ec          	movsbl %r12b,%r13d
    185e:	44 89 ef             	mov    %r13d,%edi
    1861:	e8 e3 fd ff ff       	callq  1649 <_Z5is_opc>
    1866:	84 c0                	test   %al,%al
    1868:	74 8f                	je     17f9 <_Z31build_candidate_expression_treePci+0x94>
    186a:	4c 8d 35 8f 30 00 00 	lea    0x308f(%rip),%r14        # 4900 <op_stack>
    1871:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
    1875:	85 c9                	test   %ecx,%ecx
    1877:	75 14                	jne    188d <_Z31build_candidate_expression_treePci+0x128>
    1879:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%rsp)
    1880:	00 
    1881:	44 88 25 79 30 00 00 	mov    %r12b,0x3079(%rip)        # 4901 <op_stack+0x1>
    1888:	e9 6c ff ff ff       	jmpq   17f9 <_Z31build_candidate_expression_treePci+0x94>
    188d:	48 63 c1             	movslq %ecx,%rax
    1890:	41 0f be 3c 06       	movsbl (%r14,%rax,1),%edi
    1895:	40 80 ff 29          	cmp    $0x29,%dil
    1899:	74 13                	je     18ae <_Z31build_candidate_expression_treePci+0x149>
    189b:	e8 c8 fd ff ff       	callq  1668 <_Z8priorityc>
    18a0:	44 89 ef             	mov    %r13d,%edi
    18a3:	89 c6                	mov    %eax,%esi
    18a5:	e8 be fd ff ff       	callq  1668 <_Z8priorityc>
    18aa:	39 c6                	cmp    %eax,%esi
    18ac:	7d 12                	jge    18c0 <_Z31build_candidate_expression_treePci+0x15b>
    18ae:	ff c1                	inc    %ecx
    18b0:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
    18b4:	48 63 c9             	movslq %ecx,%rcx
    18b7:	45 88 24 0e          	mov    %r12b,(%r14,%rcx,1)
    18bb:	e9 39 ff ff ff       	jmpq   17f9 <_Z31build_candidate_expression_treePci+0x94>
    18c0:	48 89 e6             	mov    %rsp,%rsi
    18c3:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    18c8:	e8 cd fd ff ff       	callq  169a <_Z11attach_nodePiS_>
    18cd:	eb a2                	jmp    1871 <_Z31build_candidate_expression_treePci+0x10c>
    18cf:	83 7c 24 04 00       	cmpl   $0x0,0x4(%rsp)
    18d4:	7e 0c                	jle    18e2 <_Z31build_candidate_expression_treePci+0x17d>
    18d6:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    18db:	e8 ba fd ff ff       	callq  169a <_Z11attach_nodePiS_>
    18e0:	eb ed                	jmp    18cf <_Z31build_candidate_expression_treePci+0x16a>
    18e2:	48 63 04 24          	movslq (%rsp),%rax
    18e6:	48 8d 15 53 30 00 00 	lea    0x3053(%rip),%rdx        # 4940 <digit_stack>
    18ed:	48 0f be 04 02       	movsbq (%rdx,%rax,1),%rax
    18f2:	48 8d 15 87 2e 00 00 	lea    0x2e87(%rip),%rdx        # 4780 <cand>
    18f9:	48 6b c0 0c          	imul   $0xc,%rax,%rax
    18fd:	48 01 d0             	add    %rdx,%rax
    1900:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    1905:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
    190c:	00 00 
    190e:	74 05                	je     1915 <_Z31build_candidate_expression_treePci+0x1b0>
    1910:	e8 8b f8 ff ff       	callq  11a0 <__stack_chk_fail@plt>
    1915:	48 83 c4 10          	add    $0x10,%rsp
    1919:	5b                   	pop    %rbx
    191a:	5d                   	pop    %rbp
    191b:	41 5c                	pop    %r12
    191d:	41 5d                	pop    %r13
    191f:	41 5e                	pop    %r14
    1921:	c3                   	retq   

0000000000001922 <_Z28compare_answer_and_candidateP9tree_nodeS0_i>:
    1922:	f3 0f 1e fa          	endbr64 
    1926:	48 85 ff             	test   %rdi,%rdi
    1929:	0f 94 c0             	sete   %al
    192c:	48 85 f6             	test   %rsi,%rsi
    192f:	0f 94 c1             	sete   %cl
    1932:	08 c8                	or     %cl,%al
    1934:	75 42                	jne    1978 <_Z28compare_answer_and_candidateP9tree_nodeS0_i+0x56>
    1936:	48 8d 0d 43 2a 00 00 	lea    0x2a43(%rip),%rcx        # 4380 <ans>
    193d:	48 8d 35 3c 2e 00 00 	lea    0x2e3c(%rip),%rsi        # 4780 <cand>
    1944:	31 ff                	xor    %edi,%edi
    1946:	39 fa                	cmp    %edi,%edx
    1948:	7c 31                	jl     197b <_Z28compare_answer_and_candidateP9tree_nodeS0_i+0x59>
    194a:	44 8a 16             	mov    (%rsi),%r10b
    194d:	49 89 c9             	mov    %rcx,%r9
    1950:	49 89 f0             	mov    %rsi,%r8
    1953:	44 38 11             	cmp    %r10b,(%rcx)
    1956:	75 25                	jne    197d <_Z28compare_answer_and_candidateP9tree_nodeS0_i+0x5b>
    1958:	44 8b 5e 04          	mov    0x4(%rsi),%r11d
    195c:	44 39 59 04          	cmp    %r11d,0x4(%rcx)
    1960:	75 1b                	jne    197d <_Z28compare_answer_and_candidateP9tree_nodeS0_i+0x5b>
    1962:	45 8b 40 08          	mov    0x8(%r8),%r8d
    1966:	48 83 c1 0c          	add    $0xc,%rcx
    196a:	48 83 c6 0c          	add    $0xc,%rsi
    196e:	45 39 41 08          	cmp    %r8d,0x8(%r9)
    1972:	75 09                	jne    197d <_Z28compare_answer_and_candidateP9tree_nodeS0_i+0x5b>
    1974:	ff c7                	inc    %edi
    1976:	eb ce                	jmp    1946 <_Z28compare_answer_and_candidateP9tree_nodeS0_i+0x24>
    1978:	31 c0                	xor    %eax,%eax
    197a:	c3                   	retq   
    197b:	b0 01                	mov    $0x1,%al
    197d:	c3                   	retq   

000000000000197e <_Z28print_candidate_tree_inorderP9tree_node>:
    197e:	f3 0f 1e fa          	endbr64 
    1982:	55                   	push   %rbp
    1983:	48 8d 2d f6 2d 00 00 	lea    0x2df6(%rip),%rbp        # 4780 <cand>
    198a:	53                   	push   %rbx
    198b:	48 89 fb             	mov    %rdi,%rbx
    198e:	52                   	push   %rdx
    198f:	80 3b 00             	cmpb   $0x0,(%rbx)
    1992:	74 33                	je     19c7 <_Z28print_candidate_tree_inorderP9tree_node+0x49>
    1994:	48 63 7b 04          	movslq 0x4(%rbx),%rdi
    1998:	48 6b ff 0c          	imul   $0xc,%rdi,%rdi
    199c:	48 01 ef             	add    %rbp,%rdi
    199f:	e8 da ff ff ff       	callq  197e <_Z28print_candidate_tree_inorderP9tree_node>
    19a4:	0f be 13             	movsbl (%rbx),%edx
    19a7:	bf 01 00 00 00       	mov    $0x1,%edi
    19ac:	31 c0                	xor    %eax,%eax
    19ae:	48 8d 35 4f 06 00 00 	lea    0x64f(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    19b5:	e8 66 f7 ff ff       	callq  1120 <__printf_chk@plt>
    19ba:	48 63 5b 08          	movslq 0x8(%rbx),%rbx
    19be:	48 6b db 0c          	imul   $0xc,%rbx,%rbx
    19c2:	48 01 eb             	add    %rbp,%rbx
    19c5:	eb c8                	jmp    198f <_Z28print_candidate_tree_inorderP9tree_node+0x11>
    19c7:	58                   	pop    %rax
    19c8:	5b                   	pop    %rbx
    19c9:	5d                   	pop    %rbp
    19ca:	c3                   	retq   

00000000000019cb <_Z25print_answer_tree_inorderP9tree_node>:
    19cb:	f3 0f 1e fa          	endbr64 
    19cf:	55                   	push   %rbp
    19d0:	48 8d 2d a9 29 00 00 	lea    0x29a9(%rip),%rbp        # 4380 <ans>
    19d7:	53                   	push   %rbx
    19d8:	48 89 fb             	mov    %rdi,%rbx
    19db:	52                   	push   %rdx
    19dc:	80 3b 00             	cmpb   $0x0,(%rbx)
    19df:	74 33                	je     1a14 <_Z25print_answer_tree_inorderP9tree_node+0x49>
    19e1:	48 63 7b 04          	movslq 0x4(%rbx),%rdi
    19e5:	48 6b ff 0c          	imul   $0xc,%rdi,%rdi
    19e9:	48 01 ef             	add    %rbp,%rdi
    19ec:	e8 da ff ff ff       	callq  19cb <_Z25print_answer_tree_inorderP9tree_node>
    19f1:	0f be 13             	movsbl (%rbx),%edx
    19f4:	bf 01 00 00 00       	mov    $0x1,%edi
    19f9:	31 c0                	xor    %eax,%eax
    19fb:	48 8d 35 02 06 00 00 	lea    0x602(%rip),%rsi        # 2004 <_IO_stdin_used+0x4>
    1a02:	e8 19 f7 ff ff       	callq  1120 <__printf_chk@plt>
    1a07:	48 63 5b 08          	movslq 0x8(%rbx),%rbx
    1a0b:	48 6b db 0c          	imul   $0xc,%rbx,%rbx
    1a0f:	48 01 eb             	add    %rbp,%rbx
    1a12:	eb c8                	jmp    19dc <_Z25print_answer_tree_inorderP9tree_node+0x11>
    1a14:	58                   	pop    %rax
    1a15:	5b                   	pop    %rbx
    1a16:	5d                   	pop    %rbp
    1a17:	c3                   	retq   

0000000000001a18 <_Z9read_linePc>:
    1a18:	f3 0f 1e fa          	endbr64 
    1a1c:	55                   	push   %rbp
    1a1d:	48 8d af 20 03 00 00 	lea    0x320(%rdi),%rbp
    1a24:	53                   	push   %rbx
    1a25:	48 89 fb             	mov    %rdi,%rbx
    1a28:	52                   	push   %rdx
    1a29:	e8 a2 f7 ff ff       	callq  11d0 <getchar@plt>
    1a2e:	48 39 eb             	cmp    %rbp,%rbx
    1a31:	73 0c                	jae    1a3f <_Z9read_linePc+0x27>
    1a33:	3c 0a                	cmp    $0xa,%al
    1a35:	74 08                	je     1a3f <_Z9read_linePc+0x27>
    1a37:	48 ff c3             	inc    %rbx
    1a3a:	88 43 ff             	mov    %al,-0x1(%rbx)
    1a3d:	eb ea                	jmp    1a29 <_Z9read_linePc+0x11>
    1a3f:	c6 03 00             	movb   $0x0,(%rbx)
    1a42:	58                   	pop    %rax
    1a43:	5b                   	pop    %rbx
    1a44:	5d                   	pop    %rbp
    1a45:	c3                   	retq   

0000000000001a46 <_Z12explode_bombv>:
    1a46:	f3 0f 1e fa          	endbr64 
    1a4a:	50                   	push   %rax
    1a4b:	58                   	pop    %rax
    1a4c:	48 8d 3d b5 05 00 00 	lea    0x5b5(%rip),%rdi        # 2008 <_IO_stdin_used+0x8>
    1a53:	50                   	push   %rax
    1a54:	e8 97 f7 ff ff       	callq  11f0 <puts@plt>
    1a59:	31 ff                	xor    %edi,%edi
    1a5b:	e8 60 f7 ff ff       	callq  11c0 <exit@plt>

0000000000001a60 <_Z16string_not_equalPcS_>:
    1a60:	f3 0f 1e fa          	endbr64 
    1a64:	31 c0                	xor    %eax,%eax
    1a66:	8a 14 06             	mov    (%rsi,%rax,1),%dl
    1a69:	84 d2                	test   %dl,%dl
    1a6b:	74 0c                	je     1a79 <_Z16string_not_equalPcS_+0x19>
    1a6d:	48 ff c0             	inc    %rax
    1a70:	3a 54 07 ff          	cmp    -0x1(%rdi,%rax,1),%dl
    1a74:	74 f0                	je     1a66 <_Z16string_not_equalPcS_+0x6>
    1a76:	31 c0                	xor    %eax,%eax
    1a78:	c3                   	retq   
    1a79:	b0 01                	mov    $0x1,%al
    1a7b:	c3                   	retq   

0000000000001a7c <_Z10string_lenPc>:
    1a7c:	f3 0f 1e fa          	endbr64 
    1a80:	31 c0                	xor    %eax,%eax
    1a82:	41 89 c0             	mov    %eax,%r8d
    1a85:	48 ff c0             	inc    %rax
    1a88:	80 7c 07 ff 00       	cmpb   $0x0,-0x1(%rdi,%rax,1)
    1a8d:	75 f3                	jne    1a82 <_Z10string_lenPc+0x6>
    1a8f:	44 89 c0             	mov    %r8d,%eax
    1a92:	c3                   	retq   

0000000000001a93 <_Z13run_lock_testP8baselockii>:
    1a93:	f3 0f 1e fa          	endbr64 
    1a97:	48 83 ec 18          	sub    $0x18,%rsp
    1a9b:	48 8b 07             	mov    (%rdi),%rax
    1a9e:	89 54 24 0c          	mov    %edx,0xc(%rsp)
    1aa2:	89 74 24 08          	mov    %esi,0x8(%rsp)
    1aa6:	48 89 3c 24          	mov    %rdi,(%rsp)
    1aaa:	ff 10                	callq  *(%rax)
    1aac:	48 8b 3c 24          	mov    (%rsp),%rdi
    1ab0:	8b 74 24 08          	mov    0x8(%rsp),%esi
    1ab4:	85 c0                	test   %eax,%eax
    1ab6:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    1aba:	75 05                	jne    1ac1 <_Z13run_lock_testP8baselockii+0x2e>
    1abc:	e8 85 ff ff ff       	callq  1a46 <_Z12explode_bombv>
    1ac1:	48 8b 07             	mov    (%rdi),%rax
    1ac4:	ff 50 08             	callq  *0x8(%rax)
    1ac7:	84 c0                	test   %al,%al
    1ac9:	74 f1                	je     1abc <_Z13run_lock_testP8baselockii+0x29>
    1acb:	48 83 c4 18          	add    $0x18,%rsp
    1acf:	c3                   	retq   

0000000000001ad0 <_Z16read_six_numbersPcPi>:
    1ad0:	f3 0f 1e fa          	endbr64 
    1ad4:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1ad8:	53                   	push   %rbx
    1ad9:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1add:	48 89 f2             	mov    %rsi,%rdx
    1ae0:	50                   	push   %rax
    1ae1:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1ae5:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1ae9:	48 89 f3             	mov    %rsi,%rbx
    1aec:	50                   	push   %rax
    1aed:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1af1:	31 c0                	xor    %eax,%eax
    1af3:	48 8d 35 2e 05 00 00 	lea    0x52e(%rip),%rsi        # 2028 <_IO_stdin_used+0x28>
    1afa:	e8 71 f6 ff ff       	callq  1170 <__isoc99_sscanf@plt>
    1aff:	5a                   	pop    %rdx
    1b00:	59                   	pop    %rcx
    1b01:	83 f8 06             	cmp    $0x6,%eax
    1b04:	75 05                	jne    1b0b <_Z16read_six_numbersPcPi+0x3b>
    1b06:	83 3b 00             	cmpl   $0x0,(%rbx)
    1b09:	75 05                	jne    1b10 <_Z16read_six_numbersPcPi+0x40>
    1b0b:	e8 36 ff ff ff       	callq  1a46 <_Z12explode_bombv>
    1b10:	5b                   	pop    %rbx
    1b11:	c3                   	retq   

0000000000001b12 <_Z7phase_1Pc>:
    1b12:	f3 0f 1e fa          	endbr64 
    1b16:	52                   	push   %rdx
    1b17:	48 63 35 22 25 00 00 	movslq 0x2522(%rip),%rsi        # 4040 <phase_1_offset>
    1b1e:	48 8d 05 3b 25 00 00 	lea    0x253b(%rip),%rax        # 4060 <w1>
    1b25:	48 01 c6             	add    %rax,%rsi
    1b28:	e8 33 ff ff ff       	callq  1a60 <_Z16string_not_equalPcS_>
    1b2d:	84 c0                	test   %al,%al
    1b2f:	75 05                	jne    1b36 <_Z7phase_1Pc+0x24>
    1b31:	e8 10 ff ff ff       	callq  1a46 <_Z12explode_bombv>
    1b36:	58                   	pop    %rax
    1b37:	c3                   	retq   

0000000000001b38 <_Z7phase_2Pc>:
    1b38:	f3 0f 1e fa          	endbr64 
    1b3c:	52                   	push   %rdx
    1b3d:	48 8d 35 dc 24 00 00 	lea    0x24dc(%rip),%rsi        # 4020 <phase_2_nums>
    1b44:	e8 87 ff ff ff       	callq  1ad0 <_Z16read_six_numbersPcPi>
    1b49:	48 8d 05 d0 24 00 00 	lea    0x24d0(%rip),%rax        # 4020 <phase_2_nums>
    1b50:	8b 0d e6 24 00 00    	mov    0x24e6(%rip),%ecx        # 403c <phase_2_nums+0x1c>
    1b56:	48 8d 50 14          	lea    0x14(%rax),%rdx
    1b5a:	8b 30                	mov    (%rax),%esi
    1b5c:	0f af f1             	imul   %ecx,%esi
    1b5f:	39 70 04             	cmp    %esi,0x4(%rax)
    1b62:	74 05                	je     1b69 <_Z7phase_2Pc+0x31>
    1b64:	e8 dd fe ff ff       	callq  1a46 <_Z12explode_bombv>
    1b69:	48 83 c0 04          	add    $0x4,%rax
    1b6d:	48 39 c2             	cmp    %rax,%rdx
    1b70:	75 e8                	jne    1b5a <_Z7phase_2Pc+0x22>
    1b72:	58                   	pop    %rax
    1b73:	c3                   	retq   

0000000000001b74 <_Z7phase_3Pc>:
    1b74:	f3 0f 1e fa          	endbr64 
    1b78:	48 83 ec 28          	sub    $0x28,%rsp
    1b7c:	48 8d 35 b7 04 00 00 	lea    0x4b7(%rip),%rsi        # 203a <_IO_stdin_used+0x3a>
    1b83:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1b8a:	00 00 
    1b8c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1b91:	31 c0                	xor    %eax,%eax
    1b93:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
    1b98:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    1b9d:	4c 8d 44 24 14       	lea    0x14(%rsp),%r8
    1ba2:	e8 c9 f5 ff ff       	callq  1170 <__isoc99_sscanf@plt>
    1ba7:	83 f8 03             	cmp    $0x3,%eax
    1baa:	75 65                	jne    1c11 <_Z7phase_3Pc+0x9d>
    1bac:	83 7c 24 10 07       	cmpl   $0x7,0x10(%rsp)
    1bb1:	77 5e                	ja     1c11 <_Z7phase_3Pc+0x9d>
    1bb3:	8b 44 24 10          	mov    0x10(%rsp),%eax
    1bb7:	48 8d 15 f6 05 00 00 	lea    0x5f6(%rip),%rdx        # 21b4 <_IO_stdin_used+0x1b4>
    1bbe:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    1bc2:	48 01 d0             	add    %rdx,%rax
    1bc5:	3e ff e0             	notrack jmpq *%rax
    1bc8:	83 7c 24 14 30       	cmpl   $0x30,0x14(%rsp)
    1bcd:	b0 70                	mov    $0x70,%al
    1bcf:	74 45                	je     1c16 <_Z7phase_3Pc+0xa2>
    1bd1:	eb 3e                	jmp    1c11 <_Z7phase_3Pc+0x9d>
    1bd3:	81 7c 24 14 dd 00 00 	cmpl   $0xdd,0x14(%rsp)
    1bda:	00 
    1bdb:	b0 62                	mov    $0x62,%al
    1bdd:	74 37                	je     1c16 <_Z7phase_3Pc+0xa2>
    1bdf:	eb 30                	jmp    1c11 <_Z7phase_3Pc+0x9d>
    1be1:	81 7c 24 14 f0 02 00 	cmpl   $0x2f0,0x14(%rsp)
    1be8:	00 
    1be9:	b0 63                	mov    $0x63,%al
    1beb:	74 29                	je     1c16 <_Z7phase_3Pc+0xa2>
    1bed:	eb 22                	jmp    1c11 <_Z7phase_3Pc+0x9d>
    1bef:	83 7c 24 14 10       	cmpl   $0x10,0x14(%rsp)
    1bf4:	b0 74                	mov    $0x74,%al
    1bf6:	74 1e                	je     1c16 <_Z7phase_3Pc+0xa2>
    1bf8:	eb 17                	jmp    1c11 <_Z7phase_3Pc+0x9d>
    1bfa:	83 7c 24 14 03       	cmpl   $0x3,0x14(%rsp)
    1bff:	b0 76                	mov    $0x76,%al
    1c01:	74 13                	je     1c16 <_Z7phase_3Pc+0xa2>
    1c03:	eb 0c                	jmp    1c11 <_Z7phase_3Pc+0x9d>
    1c05:	81 7c 24 14 00 02 00 	cmpl   $0x200,0x14(%rsp)
    1c0c:	00 
    1c0d:	b0 77                	mov    $0x77,%al
    1c0f:	74 05                	je     1c16 <_Z7phase_3Pc+0xa2>
    1c11:	e8 30 fe ff ff       	callq  1a46 <_Z12explode_bombv>
    1c16:	38 44 24 0f          	cmp    %al,0xf(%rsp)
    1c1a:	75 f5                	jne    1c11 <_Z7phase_3Pc+0x9d>
    1c1c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    1c21:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1c28:	00 00 
    1c2a:	74 05                	je     1c31 <_Z7phase_3Pc+0xbd>
    1c2c:	e8 6f f5 ff ff       	callq  11a0 <__stack_chk_fail@plt>
    1c31:	48 83 c4 28          	add    $0x28,%rsp
    1c35:	c3                   	retq   

0000000000001c36 <_Z7phase_4l>:
    1c36:	f3 0f 1e fa          	endbr64 
    1c3a:	48 89 f8             	mov    %rdi,%rax
    1c3d:	48 c1 ff 20          	sar    $0x20,%rdi
    1c41:	52                   	push   %rdx
    1c42:	8d 57 ff             	lea    -0x1(%rdi),%edx
    1c45:	83 fa 0d             	cmp    $0xd,%edx
    1c48:	77 07                	ja     1c51 <_Z7phase_4l+0x1b>
    1c4a:	ff c8                	dec    %eax
    1c4c:	83 f8 0d             	cmp    $0xd,%eax
    1c4f:	76 05                	jbe    1c56 <_Z7phase_4l+0x20>
    1c51:	e8 f0 fd ff ff       	callq  1a46 <_Z12explode_bombv>
    1c56:	e8 ed f8 ff ff       	callq  1548 <_ZL4hopei>
    1c5b:	3d 00 00 00 01       	cmp    $0x1000000,%eax
    1c60:	75 ef                	jne    1c51 <_Z7phase_4l+0x1b>
    1c62:	58                   	pop    %rax
    1c63:	c3                   	retq   

0000000000001c64 <_Z7phase_5lll>:
    1c64:	f3 0f 1e fa          	endbr64 
    1c68:	48 83 ec 48          	sub    $0x48,%rsp
    1c6c:	48 8d 0d 45 20 00 00 	lea    0x2045(%rip),%rcx        # 3cb8 <_ZTV5lock1+0x10>
    1c73:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1c7a:	00 00 
    1c7c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    1c81:	31 c0                	xor    %eax,%eax
    1c83:	48 8d 05 fe 1f 00 00 	lea    0x1ffe(%rip),%rax        # 3c88 <_ZTV8baselock+0x10>
    1c8a:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    1c8f:	48 8d 0d 52 20 00 00 	lea    0x2052(%rip),%rcx        # 3ce8 <_ZTV5lock2+0x10>
    1c96:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1c9b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ca0:	48 c1 e0 20          	shl    $0x20,%rax
    1ca4:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    1ca9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    1cae:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    1cb3:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    1cb8:	48 83 ff 01          	cmp    $0x1,%rdi
    1cbc:	7f 07                	jg     1cc5 <_Z7phase_5lll+0x61>
    1cbe:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    1cc3:	eb 26                	jmp    1ceb <_Z7phase_5lll+0x87>
    1cc5:	48 83 ff 03          	cmp    $0x3,%rdi
    1cc9:	7f 07                	jg     1cd2 <_Z7phase_5lll+0x6e>
    1ccb:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
    1cd0:	eb 19                	jmp    1ceb <_Z7phase_5lll+0x87>
    1cd2:	48 83 ff 08          	cmp    $0x8,%rdi
    1cd6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
    1cdb:	75 0e                	jne    1ceb <_Z7phase_5lll+0x87>
    1cdd:	e8 b1 fd ff ff       	callq  1a93 <_Z13run_lock_testP8baselockii>
    1ce2:	c6 05 4f 23 00 00 79 	movb   $0x79,0x234f(%rip)        # 4038 <phase_2_nums+0x18>
    1ce9:	eb 05                	jmp    1cf0 <_Z7phase_5lll+0x8c>
    1ceb:	e8 a3 fd ff ff       	callq  1a93 <_Z13run_lock_testP8baselockii>
    1cf0:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    1cf5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1cfc:	00 00 
    1cfe:	74 05                	je     1d05 <_Z7phase_5lll+0xa1>
    1d00:	e8 9b f4 ff ff       	callq  11a0 <__stack_chk_fail@plt>
    1d05:	48 83 c4 48          	add    $0x48,%rsp
    1d09:	c3                   	retq   

0000000000001d0a <_Z7phase_6Pc>:
    1d0a:	f3 0f 1e fa          	endbr64 
    1d0e:	52                   	push   %rdx
    1d0f:	e8 68 fd ff ff       	callq  1a7c <_Z10string_lenPc>
    1d14:	48 8d 15 f0 27 00 00 	lea    0x27f0(%rip),%rdx        # 450b <w2+0xb>
    1d1b:	41 89 c0             	mov    %eax,%r8d
    1d1e:	31 c0                	xor    %eax,%eax
    1d20:	41 83 f8 06          	cmp    $0x6,%r8d
    1d24:	74 05                	je     1d2b <_Z7phase_6Pc+0x21>
    1d26:	e8 1b fd ff ff       	callq  1a46 <_Z12explode_bombv>
    1d2b:	8a 0c 07             	mov    (%rdi,%rax,1),%cl
    1d2e:	48 ff c0             	inc    %rax
    1d31:	88 4c 10 ff          	mov    %cl,-0x1(%rax,%rdx,1)
    1d35:	48 83 f8 07          	cmp    $0x7,%rax
    1d39:	75 f0                	jne    1d2b <_Z7phase_6Pc+0x21>
    1d3b:	be 11 00 00 00       	mov    $0x11,%esi
    1d40:	48 8d 3d b9 27 00 00 	lea    0x27b9(%rip),%rdi        # 4500 <w2>
    1d47:	e8 19 fa ff ff       	callq  1765 <_Z31build_candidate_expression_treePci>
    1d4c:	ba 11 00 00 00       	mov    $0x11,%edx
    1d51:	48 8d 3d ac 26 00 00 	lea    0x26ac(%rip),%rdi        # 4404 <ans+0x84>
    1d58:	48 89 c6             	mov    %rax,%rsi
    1d5b:	e8 c2 fb ff ff       	callq  1922 <_Z28compare_answer_and_candidateP9tree_nodeS0_i>
    1d60:	84 c0                	test   %al,%al
    1d62:	74 c2                	je     1d26 <_Z7phase_6Pc+0x1c>
    1d64:	58                   	pop    %rax
    1d65:	c3                   	retq   

0000000000001d66 <_Z12secret_phasel>:
    1d66:	f3 0f 1e fa          	endbr64 
    1d6a:	f3 48 0f 2a c7       	cvtsi2ss %rdi,%xmm0
    1d6f:	f3 0f 58 c0          	addss  %xmm0,%xmm0
    1d73:	f3 0f 58 05 75 04 00 	addss  0x475(%rip),%xmm0        # 21f0 <_ZTS5lock2+0x7>
    1d7a:	00 
    1d7b:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
    1d7f:	66 0f 2f 05 71 04 00 	comisd 0x471(%rip),%xmm0        # 21f8 <_ZTS5lock2+0xf>
    1d86:	00 
    1d87:	73 0e                	jae    1d97 <_Z12secret_phasel+0x31>
    1d89:	f2 0f 10 0d 6f 04 00 	movsd  0x46f(%rip),%xmm1        # 2200 <_ZTS5lock2+0x17>
    1d90:	00 
    1d91:	66 0f 2f c8          	comisd %xmm0,%xmm1
    1d95:	72 06                	jb     1d9d <_Z12secret_phasel+0x37>
    1d97:	50                   	push   %rax
    1d98:	e8 a9 fc ff ff       	callq  1a46 <_Z12explode_bombv>
    1d9d:	c3                   	retq   

0000000000001d9e <_Z15congratulationsv>:
    1d9e:	f3 0f 1e fa          	endbr64 
    1da2:	48 83 ec 18          	sub    $0x18,%rsp
    1da6:	48 8d 3d 96 02 00 00 	lea    0x296(%rip),%rdi        # 2043 <_IO_stdin_used+0x43>
    1dad:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1db4:	00 00 
    1db6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    1dbb:	31 c0                	xor    %eax,%eax
    1dbd:	80 3d 74 22 00 00 79 	cmpb   $0x79,0x2274(%rip)        # 4038 <phase_2_nums+0x18>
    1dc4:	75 35                	jne    1dfb <_Z15congratulationsv+0x5d>
    1dc6:	48 8d 3d b8 02 00 00 	lea    0x2b8(%rip),%rdi        # 2085 <_IO_stdin_used+0x85>
    1dcd:	e8 1e f4 ff ff       	callq  11f0 <puts@plt>
    1dd2:	48 89 e6             	mov    %rsp,%rsi
    1dd5:	31 c0                	xor    %eax,%eax
    1dd7:	48 8d 3d e5 02 00 00 	lea    0x2e5(%rip),%rdi        # 20c3 <_IO_stdin_used+0xc3>
    1dde:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    1de5:	00 
    1de6:	e8 c5 f3 ff ff       	callq  11b0 <__isoc99_scanf@plt>
    1deb:	48 8b 3c 24          	mov    (%rsp),%rdi
    1def:	e8 72 ff ff ff       	callq  1d66 <_Z12secret_phasel>
    1df4:	48 8d 3d cc 02 00 00 	lea    0x2cc(%rip),%rdi        # 20c7 <_IO_stdin_used+0xc7>
    1dfb:	e8 f0 f3 ff ff       	callq  11f0 <puts@plt>
    1e00:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1e05:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    1e0c:	00 00 
    1e0e:	74 05                	je     1e15 <_Z15congratulationsv+0x77>
    1e10:	e8 8b f3 ff ff       	callq  11a0 <__stack_chk_fail@plt>
    1e15:	48 83 c4 18          	add    $0x18,%rsp
    1e19:	c3                   	retq   

0000000000001e1a <_ZN8baselock10is_holdingEi>:
    1e1a:	f3 0f 1e fa          	endbr64 
    1e1e:	8b 57 0c             	mov    0xc(%rdi),%edx
    1e21:	39 f2                	cmp    %esi,%edx
    1e23:	f7 d2                	not    %edx
    1e25:	0f 94 c0             	sete   %al
    1e28:	c1 ea 1f             	shr    $0x1f,%edx
    1e2b:	21 d0                	and    %edx,%eax
    1e2d:	c3                   	retq   

0000000000001e2e <_ZN8baselock8mem_syncEv>:
    1e2e:	f3 0f 1e fa          	endbr64 
    1e32:	c3                   	retq   
    1e33:	90                   	nop

0000000000001e34 <_ZN5lock110is_holdingEi>:
    1e34:	f3 0f 1e fa          	endbr64 
    1e38:	8b 57 0c             	mov    0xc(%rdi),%edx
    1e3b:	39 f2                	cmp    %esi,%edx
    1e3d:	f7 d2                	not    %edx
    1e3f:	0f 94 c0             	sete   %al
    1e42:	c1 ea 1f             	shr    $0x1f,%edx
    1e45:	21 d0                	and    %edx,%eax
    1e47:	c3                   	retq   

0000000000001e48 <_ZN5lock18mem_syncEv>:
    1e48:	f3 0f 1e fa          	endbr64 
    1e4c:	c3                   	retq   
    1e4d:	90                   	nop

0000000000001e4e <_ZN5lock210is_holdingEi>:
    1e4e:	f3 0f 1e fa          	endbr64 
    1e52:	8b 57 0c             	mov    0xc(%rdi),%edx
    1e55:	39 f2                	cmp    %esi,%edx
    1e57:	f7 d2                	not    %edx
    1e59:	0f 94 c0             	sete   %al
    1e5c:	c1 ea 1f             	shr    $0x1f,%edx
    1e5f:	21 d0                	and    %edx,%eax
    1e61:	c3                   	retq   

0000000000001e62 <_ZN5lock28mem_syncEv>:
    1e62:	f3 0f 1e fa          	endbr64 
    1e66:	c3                   	retq   
    1e67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1e6e:	00 00 

0000000000001e70 <__libc_csu_init>:
    1e70:	f3 0f 1e fa          	endbr64 
    1e74:	41 57                	push   %r15
    1e76:	4c 8d 3d e3 1d 00 00 	lea    0x1de3(%rip),%r15        # 3c60 <__frame_dummy_init_array_entry>
    1e7d:	41 56                	push   %r14
    1e7f:	49 89 d6             	mov    %rdx,%r14
    1e82:	41 55                	push   %r13
    1e84:	49 89 f5             	mov    %rsi,%r13
    1e87:	41 54                	push   %r12
    1e89:	41 89 fc             	mov    %edi,%r12d
    1e8c:	55                   	push   %rbp
    1e8d:	48 8d 2d dc 1d 00 00 	lea    0x1ddc(%rip),%rbp        # 3c70 <__do_global_dtors_aux_fini_array_entry>
    1e94:	53                   	push   %rbx
    1e95:	4c 29 fd             	sub    %r15,%rbp
    1e98:	48 83 ec 08          	sub    $0x8,%rsp
    1e9c:	e8 5f f1 ff ff       	callq  1000 <_init>
    1ea1:	48 c1 fd 03          	sar    $0x3,%rbp
    1ea5:	74 1f                	je     1ec6 <__libc_csu_init+0x56>
    1ea7:	31 db                	xor    %ebx,%ebx
    1ea9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1eb0:	4c 89 f2             	mov    %r14,%rdx
    1eb3:	4c 89 ee             	mov    %r13,%rsi
    1eb6:	44 89 e7             	mov    %r12d,%edi
    1eb9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    1ebd:	48 83 c3 01          	add    $0x1,%rbx
    1ec1:	48 39 dd             	cmp    %rbx,%rbp
    1ec4:	75 ea                	jne    1eb0 <__libc_csu_init+0x40>
    1ec6:	48 83 c4 08          	add    $0x8,%rsp
    1eca:	5b                   	pop    %rbx
    1ecb:	5d                   	pop    %rbp
    1ecc:	41 5c                	pop    %r12
    1ece:	41 5d                	pop    %r13
    1ed0:	41 5e                	pop    %r14
    1ed2:	41 5f                	pop    %r15
    1ed4:	c3                   	retq   
    1ed5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    1edc:	00 00 00 00 

0000000000001ee0 <__libc_csu_fini>:
    1ee0:	f3 0f 1e fa          	endbr64 
    1ee4:	c3                   	retq   

Disassembly of section .fini:

0000000000001ee8 <_fini>:
    1ee8:	f3 0f 1e fa          	endbr64 
    1eec:	48 83 ec 08          	sub    $0x8,%rsp
    1ef0:	48 83 c4 08          	add    $0x8,%rsp
    1ef4:	c3                   	retq   
