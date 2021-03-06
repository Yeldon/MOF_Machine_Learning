clear
clc

fig_option = 1;

dd = 0.01;

norm1 = linspace(-1+dd,1-dd,1/dd-1);
norm2 = sqrt(1-norm1.^2);
norm1 = [norm1,norm1];
norm2 = [norm2,-norm2];
intersecpt  = linspace(-1,1,101);
m1 = length(norm1);
m2 = length(intersecpt);
kk = 0;

fileID = fopen('MOF_Training.dat','w');
fileID11 = fopen('MOF_Training_Input.dat','w');
fileID12 = fopen('MOF_Training_Output.dat','w');

for i = 1:m1
	for j = 1:m2
		
			n1 = norm1(i);
			n2 = norm2(i);
			c = intersecpt(j);
			[nn,area,centroid] = Area_and_Centroid(n1,n2,c);
			if (area>0 && area ~=NaN && n1 ~=NaN && n2 ~=NaN && centroid(1) ~=NaN && centroid(2) ~=NaN && c ~=NaN) 
				kk = kk+1;
				fprintf(fileID,'%8.6f %8.6f %8.6f %8.6f %8.6f %8.6f\n',[norm1(i), norm2(i), intersecpt(j),area,centroid(1),centroid(2)]);
			    fprintf(fileID11,'%8.6f %8.6f %8.6f\n',[area,centroid(1),centroid(2)]);			    
			    fprintf(fileID12,'%8.6f %8.6f %8.6f\n',[norm1(i), norm2(i), intersecpt(j)]);
			    % clf;
			    % MOF_plot(n1,n2,c,area,centroid,fig_option);
			    % saveas(gcf,['figure/',num2str(kk),'.png'])
			end
	end
end

fclose(fileID);

		
dd = 0.01;

norm4 = linspace(-1+dd,1-dd,1/dd-1);
norm3 = sqrt(1-norm4.^2);
norm3 = [norm3,norm3];
norm4 = [norm4,-norm4];
intersecpt  = linspace(-1,1,101);
m1 = length(norm3);
m2 = length(intersecpt);
kk = 0;

fileID2 = fopen('MOF_test.dat','w');

for i = 1:m1
	for j = 1:m2
		
			n1 = norm3(i);
			n2 = norm4(i);
			c = intersecpt(j);
			[nn,area,centroid] = Area_and_Centroid(n1,n2,c);
			if (area>0 ) 
				kk = kk+1;
				fprintf(fileID2,'%8.6f %8.6f %8.6f %8.6f %8.6f %8.6f\n',[norm3(i), norm4(i), intersecpt(j),area,centroid(1),centroid(2)]);
			    % clf;
			    % MOF_plot(n1,n2,c,area,centroid,fig_option);
			    % saveas(gcf,['figure/',num2str(kk),'.png'])
			end
	end
end

fclose(fileID2);