# CSLab #3 Verilog HW
## 檔案總覽
- `FAdder.v`
    ```verilog
    module FAdder (
        output Cout, Sum,
        input A, B, Cin
    );
    ```
- `CLA.v`
    ```verilog
    module CLA_Adder8 (
        output Cout,
        output [7:0] Sum,
        input [7:0] A, B,
        input Cin
    );
    ```
- `CSA.v`
    ```verilog
    module CSA_Adder8 (
        output [7:0] Cout,
        output [7:0] Sum,
        input [7:0] A, B, C
    );
    ```
- `Wallace.v`
    ```verilog
    module WT_Multiplier4x4 (
        output [7:0] Product,
        input [3:0] A, B
    );
    ```
- `testbench.v`
- `Makefile`
    ```
    OUTPUTFILE = wallace
    run: clear build testbench.v
        iverilog -o build/$(OUTPUTFILE) testbench.v
        vvp build/$(OUTPUTFILE) > build/log
    build:
        mkdir build
    clear:
        rm -rf build
    ```


## 程式碼概述
Wallace Tree Multiplier 的實作可以分成 3 個部分：

1. 求出所有的 Partial Product
    > 實際的方式是將被乘數和乘數的各位分別作 And 運算，共有 16 個結果。另外，尚需要考慮對齊，故須補零。
2. 使用 Carry Save Adder 加總 Partial Product，每做一次加法可以將 3 行 Partial Product 化簡為 Carry, Sum 兩行
3. 當 Partial Product 只剩下 2 行，可以使用任意一種加法器，將總合放置在 `Product` 
    > 這裡使用的是 Carry Lookahead Adder，使用 Carry Ripple Adder 也可行