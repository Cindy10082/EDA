/* 绘制 Q-Q 图，使用的变量为 systolic */
/* 同时绘制了带正态分布曲线的直方图，便于两者的比较 */
​
ods graphics on;
proc univariate data=sashelp.heart ;
histogram systolic /normal;
qqplot systolic / normal (mu=est sigma=est) ;
run;
​
