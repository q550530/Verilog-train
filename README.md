# Verilog學習筆記
**基本語法**   




**位元表示** 

1.組合  

{a,b}=> a組合b
 ```
 wire [3:0] a,b,c;
 wire d;
 
 assign {d,a}=b+c;
 //d為近位數 a為加法結果
 ```
 
 2.sign extension 位元拓展  
 
 有號數位元(sign bit)  
 * 4 bit -1 = 1111
 * 4 bit +1 = 0001
 * 8 bit -1 = 1111_1111
 * 8 bit +1 = 0000_0001  
 
 有號數延伸  
 
 * 4 bit  : <-------------------Sbbb  
 * 16 bit : SSSS_SSSS_SSSS_Sbbb 
 
 有號數拓展會以最終位的延伸
 ```
 wire [3:0] a;
 wire [7:0] c,d,e;
 wire [7:0] temp;
 
 //直接以組合延伸a
  assign c=d+{8'h00,a};
  
  // 有號數a延伸
  assign temp = {{8{a[3]}}, a};
  assign e= temp + d;
 
 
 ```
 
 ---------------------------- 
