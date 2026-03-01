/* 下面的代码为数据集 SASHELP.CARS 中的 MSRP 列生成核密度估计 */
/* 有兴趣的读者，可以阅读作者的一篇有关绘制核密度图的博文: */
/* https://blogs.sas.com/content/sgf/2018/08/17/kernel-density-estimates-sas-visual-analytics/   */
​
title 'Kernel density estimates of MSRP';
proc univariate data = sashelp.cars noprint; 
  histogram MSRP / kernel (c = SJPI) endpoints = 10280 to 192465 by 12145 
  outkernel = KDE odstitle = title; 
run;
