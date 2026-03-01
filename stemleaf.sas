/* 绘制茎叶图的SAS代码段示例  */
/* 创建数据集 */  
data stemleaf;  
input num @@; 
datalines; 
5 11 2 48 17 110 15 23 
; 
run; 
data stemLeaf; 
set stemLeaf; 
  stem=floor(num/10); 
leaf=num-stem*10; 
stem=stem*10; 
run; 


/*  排序 */ 
proc sort data=stemleaf out=stemleaf; 
  by num; 
run; 

/*  设置 X 轴坐标*/ 
data stemleaf; 
 set stemleaf; 
 by stem; 
zero=0; 
 retain x 0; 
   if first.stem then x=0; 
   else x+1; 
run; 


/* 绘制茎叶图   */ 
ods graphics on; 
title '茎 叶 图'; 
proc sgplot data=stemleaf noautolegend noborder; 
format leaf z1.0; 
text x=x y=stem text=leaf / textattrs=(size=11) strip; 
xaxis display=none offsetmin=0.05 max=10; 
yaxis display=(noticks nolabel) integer values=(0 to 110 by 10) reverse fitpolicy=none; 
run;
