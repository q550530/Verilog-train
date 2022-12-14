# Verilog學習筆記
**基本語法**   
* module：verilog起始宣告的關鍵字，接著後面的括弧裡面放input,output的腳位，最後面要搭配一個endmodule，可以把數個module寫在同一個.v檔案裡面，但通常還是會拆開來寫在不同的.v檔裡面較方便管理．  
* input output：輸入輸出腳位，也可以和module裡面的訊號線合併寫成如下：  
```
 module test(
    input clk,
    input reset,
    input a,
    input b,
    output c
    );
```
* 宣告自己會用到的訊號線，宣告wire形式的話為幫你做拉線的動作，宣告成reg的話則會用暫存器幫你儲存起來  
這邊說明一下宣告的方式reg[7:0] A => 宣告一個名字為A的8bits的暫存器．  
reg[7:0] A [7:0] =>宣告8個8 bits名字為A的暫存器，使用方法就像是軟體陣列的形式．  
宣告成reg A[15:0]跟宣告成reg B[0:15]雖然都是16bits的暫存器，但儲存的方式就會不一樣了，使用上要小心，wire形式也能宣告像是array的形式，方法同reg．  

* assign：要求指定的訊號線要做什麼運算，例如：  
```
assign  tamp1 = a & b;  //把a and b 的結果指定給 tamp1，這邊要注意的是指定的對象必須宣告為wire(組合電路)的形式．
```
* always：跟assign意思差不多，但他可以在always裡面做比較多指定的運算，那裡面宣告的形式必須為reg(循序電路)的形式
* if… else…
```
always@(posedge clk)begin
  if(reset)begin

  end
  else if(判斷條件 1)begin
    敘述1
  end
  else if(判斷條件 2)begin
    敘述2
  end
      .
      .
      .
      .
      .
      .
  else begin
    敘述n
  end
end
```
* case
```
always@(posedge clk)begin
  if(reset)begin
    counter <= 0;
  end
  else begin
    case(狀態選擇)
      選擇一:
        敘述一
      選擇二:
        敘述二
      選擇三:
        敘述三
        .
        .
        .
        .
      選擇n:
        敘述n
      default:
        敘述x
    endcase
  end
end
```

以下為一簡單之範例
```
module test(clk,reset,a,b,c);

input clk;   //時脈訊號
input reset; //訊號重置 
input a ,b;     //輸入訊號

output c;//輸出訊號

wire tamp1 , temp2;  //宣告為wire訊號
reg tamp3;  //宣告為reg訊號


assign tamp1 = a & b;  //兩個輸入訊號做and
assign tamp2 = a | b;  //兩個輸入訊號做or
assign c = tamp3;

always@(*)begin 
  if(!reset)
    tamp3 <= 0; //reset等於1時做初始化
  else
    tamp3 <= ~(tamp1 ^ tamp2); //兩條訊號線做xnor
end
endmodule
```
下圖為上述之電路圖
![image](https://user-images.githubusercontent.com/93378241/193494444-9b7eb62b-d883-4072-8b0e-6cb1835aa112.png)

 ---------------------------- 
 **組合邏輯電路與循序邏輯電路**
 ![image](https://user-images.githubusercontent.com/93378241/193495792-3f4d7e13-1543-4366-8f17-dc5c6559bd4f.png)

 
* 一個完整的電路會拆成循序邏輯電路與組合邏輯電路，而組合電路就是根據目前的input值產生對應的output值，之間不受clock影響，行為描述上用always block 或者是assign的方法都可以
 
 * 循序邏輯電路，根據定義來說就是output的值會根據之前的input跟當前的input去做改變，我自己的理解是會用暫存器(flip-flop)存起來，然後把output傳送到下一層或是傳送給自己當作下一個input


 
 ![image](https://user-images.githubusercontent.com/93378241/193495642-f83599d1-d0c8-45cb-99f8-79bdbb08011d.png)

 
 ----------------------------

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
