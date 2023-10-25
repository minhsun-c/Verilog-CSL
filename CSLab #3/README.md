# CSLab #3 Verilog HW
## 檔案總覽
- `CLA.v`
    ```verilog
    module CLA_Adder4 (
        output Cout,
        output [3:0] Sum,
        input [3:0] A, B,
        input Cin
    );
    ```
- `testbench.v`
- `Makefile`
    ```
    mul: clear build testbench.v
        iverilog -o build/cla testbench.v
        vvp build/cla > build/log
    build:
        mkdir build
    clear:
        rm -rf build
    ```


## 原理概述
### 參數列表
- Propagate ($P$):
    > $P_i$ = $A_i$ ^ $B_i$

- Generate ($G$):
    > $G_i$ = $A_i$ & $B_i$

- Carry ($C$):
    > $C_{i+1}$ = $P_i$ & $C_i$ | $G_i$

### 說明
A, B 有四種可能組合： (0,0), (1,0), (0,1), (1,1)
```c
if (G == 1):
    必定有進位
else:
    if (P == 1):
        A, B 的組合為 (1,0), (0,1) 
        C 完全決定是否有進位
    else:
        A, B 的組合為 (0,0), (1,1) 
        P & C 完全不可能有進位
```

