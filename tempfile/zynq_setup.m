dev = sdrdev('AD936x');
dev = sdrdev('AD936x', 'IPAddress', '192.168.3.2')

devzynq = zynq('linux','192.168.3.2','root','root','/tmp');
hdlsetuptoolpath('ToolName','Xilinx Vivado','ToolPath', ...
                'C:\Xilinx\Vivado\2018.2\bin\vivado.bat')
setupzynqradiorepositories;

dev = sdrdev('AD936x');
downloadImage(de, 'BoardName', 'ZedBoard and FMCOMMS2/3/4', ...
                'SDCardLocation','S:')
