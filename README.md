# Tutorial
For A.  With the given **XYZ coordinate values for points** and **attribute values**
    for the points, plot a 4D figure and fit a semi-ellipsoid.

>   Run *MyPatch.m* which will call functions *ellipsoid_ex2im.m*,
>   *ellipsoid_im2ex.m*, *ellipsoidfit.m*, *ellipsoidfit_iterative.m*,
>   *ellipsoidfit_residuals.m*, *ellipsoidfit_simple.m*, *is_ellipsoid.m*,
>   *rot2quat.m*, *quat2rot.m*, and *plot_ellipsoid.m*, using **xyz.xls** and point
>   **attribute.xls** as inputs and outputting a 4D figure and a fitted figure.
# 
For B.  With the given **XY coordinate values for a dotted trace** (in Excel sheet1; 
    data in two-neighbored columns for a trace—odd-numbered columns for x;
    even-numbered columns for y) and expected **attribute values** to be
    presented for each trace (in sheet2; values in a column corresponding to a
    trace sharing the same column number), plot the traces with the exaggerated
    terminal dots in a 2D Cartesian coordinate system and column-shaped
    sub-heatmaps arranged based on the y-value of the terminal dots forming a
    ring-shaped heatmap. A line directs a sub-heatmap to its corresponding trace
    via connecting to the terminal dot.

>   Run *Circle_first_rotate_supernova.m* which will call functions *Block.m*,
>   *LinkAxes.m*, *shrink.m*, and *shrink2.m*, using **data in one.xlsx** as
>   input and outputting a Cartesian coordinate system surrounded by a heatmap.
# 
For C.  With the given **XY coordinate values for a dotted trace** (in Excel sheet1; 
    data two-neighbored columns for a trace­—odd-numbered columns for x;
    even-numbered columns for y) and expected **attribute values** to be
    presented for each trace (in sheet2; values in a column corresponding to a
    trace in order), plot the traces with the exaggerated terminal dots in a
    ‘hypsographic map’ and column-shaped sub-heatmaps arranged based on the
    y-value of the terminal dots forming a ring-shaped heatmap. A line directs a
    sub-heatmap to its corresponding trace via connecting to the terminal dot.

>   Run *Circle_second_with_time_supernova.m* which calls functions
>   *Block.m*, using **data in one.xlsx** as input and outputting a hypsographic
>   system surrounded by a heatmap.
# 
For D.  With the given **XY coordinate values for a scatterplot**, plot a collection
    of points using a Cartesian coordinate with an additional variable being
    displayed—the points are color-coded by local density on the vertical axis
    for a set of data, like a heatmap.

>   Run *MainFun2.m* which calls functions *plot_mean_sem.m* and *plot_star.m*,
>   using data.xlsx as input and outputting a color-coded scatterplot with mean
>   ± sem and the p value of two-tailed Student's *t*-test displayed as numbers of \*.
# 
For E.  With the given data characterized by multiply sets, five (or less) elements
    repeated in each set, plot a set-based schematic with multiply Cartesian
    coordinate systems to display the proportion of each element in a set:
    Relative size of dots stand for the proportions; the highest occurrence
    element is shown in the center of a coordinate system. Starting at row no.1,
    each set of the raw data is in a row of **Data.xlsx**.

>   1.  Copy/paste the data to **Data2sheets.xlsm with a macro**.

>   2.  Double-click any cell and wait for same time (depending on the column
>       numbers) to make the macro run in Excel version 2016 to relocate members of
>       a column to a new Excel sheet (named as 1, 2, 3…), orderly. See the
>       **Figure**.

>   3.  Delete the ‘sheet1’ (i.e., the raw data) and save to
>       **Data_in_sheets.xlsx**.

>   4.  Run testGrid2.m call *get_column.m* and *init.m*, using
>       **Data_in_sheets.xlsx** as input and outputting a set-based statistical
>       graph.

![image](https://github.com/gaskinwang/ShowData/blob/master/macrofigure.png)
