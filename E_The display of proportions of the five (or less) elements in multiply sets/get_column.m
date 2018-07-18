function s = get_column(column)
s = '';
while column > 0
    a = mod(column - 1, 26);
    c = char(a + 'A');
    s = [c s];
    column = floor((column-1) / 26);
end
