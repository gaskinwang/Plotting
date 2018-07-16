function [Workbook, Sheets] = init()
% �趨����Excel�ļ�����·��
filespec_user = [pwd '\data4.xlsx'];

% �ж�Excel�Ƿ��Ѿ��򿪣����Ѵ򿪣����ڴ򿪵�Excel�н��в���������ʹ�Excel
try
    % ��Excel�������Ѿ��򿪣���������Excel
    Excel = actxGetRunningServer('Excel.Application');
catch
    % ����һ��Microsoft Excel�����������ؾ��Excel
    Excel = actxserver('Excel.Application'); 
end

% ����Excel������Ϊ�ɼ�״̬
Excel.Visible = 1;    % set(Excel, 'Visible', 1); 

% �������ļ����ڣ��򿪸ò����ļ��������½�һ����������������
if exist(filespec_user,'file')
    Workbook = Excel.Workbooks.Open(filespec_user);
    % Workbook = invoke(Excel.Workbooks,'Open',filespec_user);
else
    Workbook = Excel.Workbooks.Add;
    % Workbook = invoke(Excel.Workbooks, 'Add');
    Workbook.SaveAs(filespec_user);
end

% ���ص�ǰ��������
Sheets = Excel.ActiveWorkbook.Sheets;    % Sheets = Workbook.Sheets;
% Sheet1 = Sheets.Item(1);    % ���ص�1�������
% Sheet1.Activate;    % �����1�����
