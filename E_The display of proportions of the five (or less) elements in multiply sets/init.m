function [Workbook, Sheets] = init()
% Set the name and path of the Excel file 
filespec_user = [pwd '\data_in_sheets.xlsx'];

% Determine if Excel is open. If it is already open, open the .xlsx in Excel, otherwise open Excel.
try
    % If the Excel server is already open, return its handle Excel
    Excel = actxGetRunningServer('Excel.Application');
catch
    % Create a Excel server and return the handle Excel
    Excel = actxserver('Excel.Application'); 
end

% Set the Excel server to be visible
Excel.Visible = 1;    % set(Excel, 'Visible', 1); 

% If the excel file exists, open it, otherwise, create a new workbook and save it.
if exist(filespec_user,'file')
    Workbook = Excel.Workbooks.Open(filespec_user);
    % Workbook = invoke(Excel.Workbooks,'Open',filespec_user);
else
    Workbook = Excel.Workbooks.Add;
    % Workbook = invoke(Excel.Workbooks, 'Add');
    Workbook.SaveAs(filespec_user);
end

% Returns the current sheet handle
Sheets = Excel.ActiveWorkbook.Sheets;    % Sheets = Workbook.Sheets;
% Sheet1 = Sheets.Item(1);  
% Sheet1.Activate;    
