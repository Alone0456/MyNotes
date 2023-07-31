;输入一个小写字母，自动转换为大写字母
STACK   SEGMENT  STACK          ;；定义堆栈段
        DB 100 DUP (?)          ;；开辟100个存储单元
STACK  	ENDS			;	；堆栈段结束

CODE  	SEGMENT		;		；定义代码段
      	ASSUME  CS:CODE , SS:STACK
START:  MOV  AH ,01H      ;；1号调用,从键盘输入一字符存入AL
        INT  21H
        SUB  AL ,20H     ;；将AL中字符的ASCII码减去20H变成大写字母
        MOV  DL ,AL		;；结果送DL
        MOV  AH ,02H 	       ; ；2号调用,在屏幕上显示DL中的内容
        INT  21H 
        MOV  AH,4CH		;；返回DOS 
        INT  21H 					
CODE    ENDS			;；代码段结束
        END  START		;；程序汇编结束
