op%%LOADING   
 addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data')
        cd('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data');
        
        
        load('CPx.mat')
         
        %% 
%CPx.matcode 
    
    %CP4
    addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP4\processed\01-Apr-2019')
        CP4May = open('01-Apr-2019_fitbitdata.mat')
        CP4May = CP4May.fitbitdata
        
    addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP4\processed\01-May-2019')
        CP4May = open('01-May-2019_fitbitdata.mat')
        CP4May = CP4May.fitbitdata

     %CP3
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP3\processed\02-Apr-2019')
        CP4May =  open('02-Apr-2019_fitbitdata.mat')
        CP4May = CP4May.fitbitdata 
        
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP3\processed\01-May-2019')
        CP4May = open('01-May-2019_fitbitdata.mat')
        CP4May = CP4May.fitbitdata
        
   
     %CP2
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP2\processed\01-Apr-2019')
        CP2Apr = open('01-Apr-2019_fitbitdata.mat')
        CP2Apr = CP2Apr.fitbitdata
        
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP2\processed\02-May-2019')
        CP2May = open('02-May-2019_fitbitdata.mat')
        CP2May = CP2May.fitbitdata
        
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP2\processed\01-Feb-2019')
        CP4May = open('01-Feb-2019_fitbitdata.mat')
        CP4May = CP4May.fitbitdata
        
    
        
            
        
 %% Adds Sleep Stage Levels



for i = 1: length(CP4Apr.Sleep{:,5})   
        
    if strcmp(CP4Apr.Sleep{i,5}{1},'light')
            CP4Apr.Sleep{i,6} = 3
        
        elseif strcmp(CP4Apr.Sleep{i,5}{1}, 'deep')
               CP4Apr.Sleep{i,6} = 1
       
        elseif strcmp(CP4Apr.Sleep{i,5}{1}, 'wake')
                CP4Apr.Sleep{i,6} = 7
       
        elseif strcmp(CP4Apr.Sleep{i,5}{1}, 'rem')
                CP4Apr.Sleep{i,6} = 6
    
                
        end 
end

 %% plotting sleep data
%fig.Color = [1 0.4 0.6]; PINK!
%Purple [0.4940 0.1840 0.5560]
%[0.4660 0.6740 0.1880] green



load('CP4May.mat')
load('CP4Apr.mat')
load('CP3Apr.mat')
load('CP3May.mat')
% can plot day by day somnogram by finding where index for one day

%for checks
dt = (CP4Apr.Sleep{:,2});
dt.Format = 'dd';
column1 = cellstr(dt) ;       
dt.Format = 'MMM';
column2 = cellstr(dt); 
dt.Format = 'yyyy';
column3 = cellstr(dt);
B = setdiff(column1, column2);

%find where the day changes + plotting
% for the length of switchday a = 1:length(switchday)
% plot only from switchday(a) to switchday(a+1)


holdSleepdat = datevec(CP4Apr.Sleep{:,2});
newday = diff(holdSleepdat(:,3));
switchday = find(newday == 1);
 a = switchday;


 %hours
 
 holdTimedat = timvec(CP4May.Sleep{:,2});
 time = diff(holdTimedat)

%% CP4 May   
%CP4 May 2 - 10
 for z = 1:2; j = z- 1;
    subplot 511  
    if z == 1
          hold on
          plot(CP4May.Sleep{1:a(z),2},CP4May.Sleep{1:a(z),6},'blue','linewidth',0.5)
            xlabel('Time')
                   x1 = datetime([B{1} '-May-2019 22:00:00'])
                   x2 = datetime([B{2} '-May-2019 6:00:00'])
                     xlim ([x1 x2])
             ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP4' B{1} '-' B{3} 'Somnogram'])
             
              
    else
        plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
            xlabel('Time')
                   x1 = datetime([B{1} '-May-2019 22:00:00'])
                   x2 = datetime([B{2} '-May-2019 6:00:00'])
                     xlim ([x1 x2])
             ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP4 May '  B{1} ' - ' B{2} ' Somnogram'])
                hold on
    end
    
    
 end
                    
 for z = 2:3; j = z - 1
    subplot 512 
    plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                   xlabel('Time')
                   x1 = datetime([B{2} '-May-2019 22:00:00'])
                   x2 = datetime([B{3} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{2} ' - ' B{3} ' Somnogram'])
                hold on
     
  end

 for  z = 3:4;  j = z-1;
     subplot 513
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                   x1 = datetime([B{3} '-May-2019 23:00:00'])
                   x2 = datetime([B{4} '-May-2019 14:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{4} ' Somnogram'])
       hold on      
 end
 
  for  z = 4:5;  j = z-1;
     subplot 514
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                   xlabel('Time')
                   x1 = datetime([B{4} '-May-2019 22:00:00'])
                   x2 = datetime([B{5} '-May-2019 8:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{4} ' - ' B{5} ' Somnogram'])
                hold on
  end   
  
   for  z = 5:7;  j = z-1;
     subplot 515
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                             xlabel('Time')
                   x1 = datetime([B{6} '-May-2019 23:00:00'])
                   x2 = datetime([B{7} '-May-2019 8:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{6} ' - ' B{7} ' Somnogram'])
                hold on
   end 

% end

%May 11
   
for  z = 8:9;  j = z-1;
     subplot 511
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{8} '-May-2019 23:00:00'])
                   x2 = datetime([B{9} '-May-2019 7:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{8} ' - ' B{9} ' Somnogram'])
       hold on
end
    
for  z = 9:10;  j = z-1;
     subplot 512
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{9} '-May-2019 23:40:00'])
                   x2 = datetime([B{10} '-May-2019 9:30:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{9} ' - ' B{10} ' Somnogram'])
       hold on
end 
  
for  z = 11:12;  j = z-1;
     subplot 513
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{11} '-May-2019 23:40:00'])
                   x2 = datetime([B{12} '-May-2019 9:30:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{11} ' - ' B{12} ' Somnogram'])
       hold on
end 
   
   %to test GAPS in Data plot from the last data point to no 
    % ex 12:13 test using 11:13
        % and set x lim to B{1} @ 6Pm
   
for  z = 12:13;  j = z-1;
     subplot 514
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)     
         xlabel('Time')
                   x1 = datetime([B{12} '-May-2019 23:50:00'])
                   x2 = datetime([B{13} '-May-2019 8:30:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{12} ' - ' B{13} ' Somnogram'])
       hold on
                
end 
       
for  z = 13:14;  j = z-1;
     subplot 515
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{13} '-May-2019 23:50:00'])
                   x2 = datetime([B{14} '-May-2019 7:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{13} ' - ' B{14} ' Somnogram'])
       hold on
end 
%  End May 17


% START MAY 17

 for  z = 14:15;  j = z-1;
     subplot 511
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
        xlabel('Time')
                   x1 = datetime([B{14} '-May-2019 23:50:00'])
                   x2 = datetime([B{15} '-May-2019 9:30:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{14} ' - ' B{15} ' Somnogram'])
                hold on
 end    
 
for  z = 15:16;  j = z-1;
     subplot 512
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
               xlabel('Time')
                   x1 = datetime([B{15} '-May-2019 23:00:00'])
                   x2 = datetime([B{16} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{15} ' - ' B{16} ' Somnogram'])
                hold on
end
 
for  z = 16:17;  j = z-1;
     subplot 513
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
               xlabel('Time')
                   x1 = datetime([B{16} '-May-2019 23:00:00'])
                   x2 = datetime([B{17} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{16} ' - ' B{17} ' Somnogram'])
                hold on
end
   
for  z = 17:18;  j = z-1;
     subplot 514
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{17} '-May-2019 23:00:00'])
                   x2 = datetime([B{18} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{17} ' - ' B{18} ' Somnogram'])
                hold on
end

for  z = 18:19;  j = z-1;
     subplot 515
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{18} '-May-2019 23:00:00'])
                   x2 = datetime([B{19} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{18} ' - ' B{19} ' Somnogram'])
                hold on
end
% END MAY 22

%Start May 22
 for  z = 19:20;  j = z-1;
     subplot 511
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
        xlabel('Time')
                   x1 = datetime([B{19} '-May-2019 23:00:00'])
                   x2 = datetime([B{20} '-May-2019 9:30:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{19} ' - ' B{20} ' Somnogram'])
                hold on
 end    
 
for  z = 21:22;  j = z-1;
     subplot 512
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
               xlabel('Time')
                   x1 = datetime([B{21} '-May-2019 23:00:00'])
                   x2 = datetime([B{22} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{21} ' - ' B{22} ' Somnogram'])
                hold on
end
 
for  z = 22:23;  j = z-1;
     subplot 513
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
               xlabel('Time')
                   x1 = datetime([B{22} '-May-2019 23:00:00'])
                   x2 = datetime([B{23} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{22} ' - ' B{23} ' Somnogram'])
                hold on
end
   
for  z = 23:24;  j = z-1;
     subplot 514
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{23} '-May-2019 23:00:00'])
                   x2 = datetime([B{24} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{22} ' - ' B{24} ' Somnogram'])
                hold on
end

for  z = 24:25;  j = z-1;
     subplot 515
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{24} '-May-2019 23:00:00'])
                   x2 = datetime([B{25} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{24} ' - ' B{25} ' Somnogram'])
                hold on
end
% END 28

%Start 28
for  z = 25:26;  j = z-1;
     subplot 311
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
        xlabel('Time')
                   x1 = datetime([B{25} '-May-2019 23:00:00'])
                   x2 = datetime([B{26} '-May-2019 9:30:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{25} ' - ' B{26} ' Somnogram'])
                hold on
 end    
 
for  z = 26;  j = z-1;
     subplot 312
     plot(CP4May.Sleep{a(j):a(z),2},CP4May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
               xlabel('Time')
                   x1 = datetime([B{26} '-May-2019 23:00:00'])
                   x2 = datetime([B{27} '-May-2019 9:00:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{26} ' - ' B{27}  ' Somnogram'])
                hold on
end
 
for  z = 26;  j = z-1;
     subplot 313
     plot(CP4May.Sleep{a(j):29004,2},CP4May.Sleep{a(j):29004,6},'blue','linewidth',0.5)
               xlabel('Time')
                  x1 = datetime([B{27} '-May-2019 23:00:00'])
                  x2 = datetime([B{28} '-May-2019 8:40:00'])
                     xlim ([x1 x2])
         ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 May ' B{27} ' - ' B{28} ' Somnogram'])
                hold on
end
%END MAY

%% CP4 April

%Start April 1(night) - 6(morning) B{1} - B{6}
for z = 1  j = z-1;
    subplot 611
         hold on
        plot(CP4Apr.Sleep{1:a(z),2},CP4Apr.Sleep{1:a(z),6},'blue','linewidth',0.5)
           xlabel('Time')
                   x1 = datetime([B{1} '-April-2019 00:00:00'])
                   x2 = datetime([B{1} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{1} ' Somnogram'])
              
  
     
end

for  z = 1:2;  j = z-1;
     subplot 612
  if z == 1 
      hold on
            plot(CP4Apr.Sleep{1:a(z),2},CP4Apr.Sleep{1:a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                   x1 = datetime([B{1} '-April-2019 23:00:00'])
                   x2 = datetime([B{2} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{2} ' Somnogram'])  

          
  else
      
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                  x1 = datetime([B{1} '-April-2019 23:00:00'])
                  x2 = datetime([B{2} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                             title(['CP4 April '  B{2} ' Somnogram'])
              hold on
  end
  
  
  
 end
 
for  z = 2:3;  j = z-1;
     subplot 613
     plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                  xlabel('Time')
                   x1 = datetime([B{2} '-April-2019 23:00:00'])
                   x2 = datetime([B{3} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 April '  B{3} ' Somnogram'])
                hold on
end  
  
for  z = 3:4;  j = z-1;
     subplot 614
     plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
               xlabel('Time')
                   x1 = datetime([B{3} '-April-2019 23:00:00'])
                   x2 = datetime([B{4} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 April '  B{4} ' Somnogram'])
                hold on
end 
  
for  z = 4:5;  j = z-1;
     subplot 615
     plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                   x1 = datetime([B{4} '-April-2019 23:00:00'])
                   x2 = datetime([B{5} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 April '  B{5} ' Somnogram'])
                hold on
end
  
for  z = 5:6;  j = z-1;
     subplot 616
     plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                   x1 = datetime([B{5} '-April-2019 23:00:00'])
                   x2 = datetime([B{6} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                 title(['CP4 April '  B{6} ' Somnogram'])
                hold on
end
% End

%Start Apr 7night - 12(morning) B{6} - B{12}
for z = 6:7;  j = z-1;
    subplot 611
      plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{6} '-April-2019 23:30:00'])
                   x2 = datetime([B{7} '-April-2019 9:30:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{7} ' Somnogram'])
              hold on
end

for z = 7:8;  j = z-1;
    subplot 612
      plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{7} '-April-2019 23:00:00'])
                   x2 = datetime([B{8} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{8} ' Somnogram'])
              hold on
end

for z = 8:9;  j = z-1;
    subplot 613
      plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{8} '-April-2019 23:00:00'])
                   x2 = datetime([B{9} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{9} ' Somnogram'])
              hold on
end

for z = 9:10;  j = z-1;
    subplot 614
      plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{9} '-April-2019 23:00:00'])
                   x2 = datetime([B{10} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{10} ' Somnogram'])
              hold on
end

for z = 10:11;  j = z-1;
    subplot 615
      plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{10} '-April-2019 23:30:00'])
                   x2 = datetime([B{11} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{11} ' Somnogram'])
              hold on
end

for z = 11:12;  j = z-1;
    subplot 616
      plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{11} '-April-2019 23:15:00'])
                   x2 = datetime([B{12} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{12} ' Somnogram'])
              hold on
end
% End 

%Start Apr13* - APril 19 // B{13} - B{19}
%   *No data for Apr 12(night)- May 13(morning)
%   *start Apr 13 at 11PM
for z = 13:14;  j = z-1;
    subplot 611
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{13} '-April-2019 23:15:00'])
                   x2 = datetime([B{14} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{14} ' Somnogram'])
              hold on
end

for z = 14:15;  j = z-1;
    subplot 612
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{14} '-April-2019 23:00:00'])
                   x2 = datetime([B{15} '-April-2019 8:30:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{15} ' Somnogram'])
              hold on
end

for z = 15:16;  j = z-1;
    subplot 613
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{15} '-April-2019 23:00:00'])
                   x2 = datetime([B{16} '-April-2019 9:30:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{16} ' Somnogram'])
              hold on
end

for z = 16:17;  j = z-1;
    subplot 614
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{16} '-April-2019 23:30:00'])
                   x2 = datetime([B{17} '-April-2019 9:30:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{17} ' Somnogram'])
              hold on
end

for z = 17:18;  j = z-1;
    subplot 615
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{17} '-April-2019 23:00:00'])
                   x2 = datetime([B{18} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{18} ' Somnogram'])
              hold on
end

for z = 18:19;  j = z-1;
    subplot 616
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{18} '-April-2019 23:00:00'])
                   x2 = datetime([B{19} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{19} ' Somnogram'])
              hold on
end
% END

%Start Apr 1(night) - Apr 25(morning) B{19} - b{25}
for z = 19:20;  j = z-1;
    subplot 611
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{19} '-April-2019 23:15:00'])
                   x2 = datetime([B{20} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{20} ' Somnogram'])
              hold on
end

for z = 20:21;  j = z-1;
    subplot 612
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{20} '-April-2019 23:00:00'])
                   x2 = datetime([B{21} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{21} ' Somnogram'])
              hold on
end

for z = 21:22;  j = z-1;
    subplot 613
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{21} '-April-2019 23:00:00'])
                   x2 = datetime([B{22} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{22} ' Somnogram'])
              hold on
end

for z = 22:23;  j = z-1;
    subplot 614
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{22} '-April-2019 23:00:00'])
                   x2 = datetime([B{23} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{23} ' Somnogram'])
              hold on
end

for z = 23:24;  j = z-1;
    subplot 615
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{23} '-April-2019 23:00:00'])
                   x2 = datetime([B{24} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{24} ' Somnogram'])
              hold on
end

for z = 24:25;  j = z-1;
    subplot 616
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{24} '-April-2019 23:00:00'])
                   x2 = datetime([B{25} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{25} ' Somnogram'])
              hold on
end
%END

%start Apr25 night B{25} 
for z = 25:26;  j = z-1;
    subplot 511
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{25} '-April-2019 23:30:00'])
                   x2 = datetime([B{26} '-April-2019 9:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{26} ' Somnogram'])
              hold on
end

for z = 26:27;  j = z-1;
    subplot 512
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{26} '-April-2019 22:15:00'])
                   x2 = datetime([B{27} '-April-2019 8:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{27} ' Somnogram'])
              hold on
end

for z = 27:28;  j = z-1;
    subplot 513
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{27} '-April-2019 21:20:00'])
                   x2 = datetime([B{28} '-April-2019 7:00:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{28} ' Somnogram'])
              hold on
end

for z = 28:29;  j = z-1;
    subplot 514
    plot(CP4Apr.Sleep{a(j):a(z),2},CP4Apr.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{28} '-April-2019 20:00:00'])
                   x2 = datetime([B{29} '-April-2019 6:30:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{29} ' Somnogram'])
              hold on
end

for z = 29:30  j = z-1;
     subplot 515
    plot(CP4Apr.Sleep{a(j):32988,2},CP4Apr.Sleep{a(j):32988,6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{29} '-April-2019 20:00:00'])
                   x2 = datetime([B{30} '-April-2019 6:20:00'])
                     xlim ([x1 x2])
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
            title(['CP4 April '  B{30} ' Somnogram'])
              hold on
end



 
                    
%% heart rate and stim

plot(CP2May.HR{:,1},CP2May.HR{:,3},'red')   
            title ('CP2 May Heart Rate' )
                xlabel('Date')
                ylabel('Heartrate')
    hold on; 
    
    % i  = 1: # of dates for stim changes 
    i = 1:2
    stim = datetime({'5/13/2019' '5/14/2019'});
    y1 = get(gca, 'ylim')
    %x1 = stim(i){1}
    
for  x1 = stim(i)
      plot([x1 x1],[y1(1), y1(2)],'blue')
      
end

legend({'Heart Rate', 'Change in Stim Settings','Average Heart Rate'})





%% Time In sleep Stages 

% find where data set  ~= 0 
  %assign it as var 
  %plot(x(var),y(var))

a = CP4AprSleepStage{:,4} ~= 0;
Awake = CP4AprSleepStage{:,4};
DateS = CP4AprSleepStage{:,1}; 

  plot(DateS(a),Awake(a),'color',[0.4660 0.6740 0.1880])

    
 
     hold on; 
     
l = CP4AprSleepStage{:,5} ~= 0; 
Light = CP4AprSleepStage{:,5};
DateS = CP4AprSleepStage{:,1}; 

    plot(DateS(l),Light(l),'blue')
 
    

    
dt = CP4AprSleepStage{:,6} ~=0;
Deep = CP4AprSleepStage{:,6};
DateS = CP4AprSleepStage{:,1}; 
    
    plot(DateS(dt),Deep(dt),'black')
    

r = CP4AprSleepStage{:,7} ~=0;
Rem = CP4AprSleepStage{:,7};
DateS = CP4AprSleepStage{:,1};

    plot(DateS(r),Rem(r),'color',[0.4940 0.1840 0.5560])

xlabel('Date')
ylabel('Minutes in Sleep Stage')
legend({'Awake','Light','Deep','REM'})
title('CP4 April Minutes in Sleep Stage')
    

                
%% Plotting Steps

    % plotting Steps
 
 plot(CP3MayDateSt(s),CP3MaySt(s))
            
               title ('CP3 Steps for May' )
                xlabel('Date')
                ylabel('Steps')



plot(CP4May.Steps{:,1},CP4May.Steps{:,2})
   title ('CP4 Steps for April')
                xlabel('Date')
                ylabel('Steps')
                
    
              

%% subplotting for Sleep Log
subplot 211 
   plot(CP4May.SleepLog{:,1},CP4May.SleepLog{:,4},'color',[0.4940 0.1840 0.5560])
        xlabel ('Date')
        ylabel ('Efficiency')
        title('CP4 April Sleep Efficiency')

subplot 212
   
    plot (CP4May.SleepLog{:,1},CP4May.SleepLog{:,7},'blue')
    
    hold on;
    
    plot (CP4May.SleepLog{:,1},CP4May.SleepLog{:,9},'color',[0.4660 0.6740 0.1880])
        xlabel ('Date')
            
        ylabel ('Minutes')
        
        
        legend ({'Minutes Asleep', 'Minutes in Bed'})
   
    title('CP4 April Minutes Asleep vs. Minutes in Bed')
        
    


%legend ({plot1, plot2, plot3}
xlabel ('')
ylabel ('')
%xlim([50 100])
%ylim ([0 10])'

%%Plotting Full Somnogram 

plot(CP4Apr.Sleep{:,2},CP4Apr.Sleep{:,6},'color',[1 0.4 0.6])
   title ('CP4 April Somnogram')
                xlabel('Date')
                
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                         




