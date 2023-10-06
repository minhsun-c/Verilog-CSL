# CSLab #1 Verilog HW
## 檔案總覽
- `fAdder.v`
    ```
    module Full_Adder(
        input A, B, Cin,
        output Sum, Cout    
    );
    ```
- `fAdder_tb.v`：測試 `Full_Adder` 的正確性
- `8Adder.v`
    ```
    module Adder8(
        input [7:0] A, B,
        input Cin,
        output [7:0] Sum,
        output Cout    
    );
    ```
- `8Adder_tb.v`：測試 `Adder8` 的正確性

## Compiler Directive
編譯器指引是由 `` ` `` 這個符號鎖起頭的， `` `define``, `` `include``, `` `ifdef`` 都是 Verilog 的編譯器指引。

1. `` `include`` 常被用在 testbench 中，因為我們要把欲測試的模組引入 testbench
    ```
    `include "file.v"
    ```
2. 為了預防我們重複引入相同檔案，我們會加入簡單的條件判斷。簡單來說，我們將整個模組定義成一個程式區塊，如果已經出現在欲編譯的檔案，就不引入。
    ```
    `ifndef _FILE_V
    `define _FILE_V
    
    module my_module ( ... );
        // some code
    endmodule

    `endif
    ```

## 編譯檔案
因為上述的所有檔案，都有加上適當的編譯器指引，因此我們只需要對 testbench 編譯並執行，就可以適當測試我們的目標。

1. 編譯並執行「全加法器」測試檔
```
iverilog -o fAdder fAdder_tb.v
vvp fAdder
gtkwave FAdder.vcd
```
2. 編譯並執行「8 位元加法器」測試檔
```
iverilog -o 8Adder 8Adder_tb.v
vvp 8Adder
gtkwave 8Adder.vcd
```