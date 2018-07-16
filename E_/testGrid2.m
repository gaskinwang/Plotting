function testGrid()
[m, n] = getsize();
counts = zeros(m, n, 5);
keySet = {'a', 'b', 'c', 'd', 'e', 'o'};
valueSet = [1, 2, 3, 4, 5, 0];
colorSet = {'y', 'g', [0 0.529 1], 'r', 'k', [255 255 255]};  % abcde: »ÆÂÌÀ¶ºìºÚ
changemap = containers.Map(keySet, valueSet);
colormap = containers.Map(keySet, colorSet);
[Workbook, Sheets] = init();
for num = 1:Sheets.Count
    Sheet = Sheets.Item(num);
    Sheet.Activate;
    A = Sheet.Range(['A1:', get_column(n), num2str(m)]).Value;
    for i = 1:m
        for j = 1:n
            if isnan(A{i, j})
                A{i, j} = 'o';
            end
        end
    end
    for i = 1:m
        for j = 1:n
            if changemap(A{i, j}) ~= 0
                counts(i, j, changemap(A{i, j})) = counts(i, j, changemap(A{i, j})) + 1;
            end
        end
    end
end
props = getproportion(counts);
drawcircles(props, colormap)

function drawcircles(props, colormap)
[m, n, ~] = size(props);
k = 1;
for i = 1:m
    for j = 1:n
        subplot(m, n, k)
        k = k + 1;
        p = props(i, j, :);
        dodrawcircles(p, colormap);
    end
end

function dodrawcircles(p, colormap)
p = reshape(p, [1, 5]);
[pv, c] = max(p);       % ¸ÅÂÊÖµºÍÐòºÅ
scatter(0, 0, 300 * pv, colormap(char('a' + c - 1)), 'filled');
hold on
axis([-1, 1, -1, 1])
postemp = [0.5,0.5;0.5,-0.5;-0.5,0.5;-0.5,-0.5];
k = 1;
for i = 1:length(p)
    if i ~= c && p(i) > eps
        scatter(postemp(k,1), postemp(k,2), 300 * p(i), colormap(char('a' + i - 1)), 'filled');
        k = k + 1;
    end
end

function props = getproportion(counts)
[m, n, ~] = size(counts);
props = zeros(m, n, 5);
for i = 1:m
    for j = 1:n
        v = counts(i, j, :);
        v = v / sum(v);
        props(i, j, :) = v;
    end
end

function [m, n] = getsize()
[~, txt] = xlsread('data4.xlsx');
[m, n] = size(txt);
