%movierun
v=VideoWriter('project4_kmov','MPEG-4');open(v)
for k=7:.1:8
    brusselatormov(0,10,0,10,0,2000,20,20,2000,k)
    frame=getframe;writeVideo(v,frame);
end
close(v)