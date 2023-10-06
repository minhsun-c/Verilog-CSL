# Verilog-CSL
## Verilog 環境
- 編譯器：Icarus Verilog
  - [iverilog for Windows](https://bleyer.org/icarus/iverilog-v12-20220611-x64_setup.exe)
  - iverilog for MacOS / Linux
    ```
    brew install icarus-verilog
    ```
- 波形圖：[gtkwave](https://gtkwave.sourceforge.net)

> Windows 使用者需要先將 `iverilog` 設定為環境變數，相關說明可以查閱 [連結](https://hjwang520.pixnet.net/blog/post/404935456-win-10設定環境變數)

## iverilog 指令說明
**注意：以下指令可執行的條件是 iverilog 已經被設為環境變數**
- 使用 `命令提示字元(Windows)`, `終端機(UNIX)`
- 編譯：將 `file.v` 編譯為執行檔 `myfile`
    ```
    iverilog -o myfile file.v
    ```
- 執行：透過 `vvp` 執行執行檔 `myfile`
    ```
    vvp myfile
    ```
- 顯示波形圖：透過 `gtkwave` 顯示 `myfile.vcd`
    ```
    gtkwave myfile.vcd
    ```
- 其他指令

| | CMD | Terminal |
| :--- | :---: | :---: | 
| 查看當前資料夾 | dir | ls | 
| 轉換路徑 | cd \<path> | cd \<path> | 
| 轉換路徑 | cd .. | cd .. | 
| 新增資料夾 | mkdir \<folder> | mkdir \<folder> |
| 顯示檔案內容 | type \<file> | cat \<file> |