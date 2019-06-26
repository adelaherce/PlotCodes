%% Set up to plot somnogram - need these vars
dt = (CP3May.Sleep{:,2});
dt.Format = 'dd';
column1 = cellstr(dt) ;       
dt.Format = 'MMM';
column2 = cellstr(dt); 
dt.Format = 'yyyy';
column3 = cellstr(dt);

B = setdiff(column1, column2);





holdSleepdat = datevec(CP3May.Sleep{:,2});
newday = diff(holdSleepdat(:,3));
switchday = find(newday == 1);
 a = switchday;

 

 

%%  May
% May 15  - 22
for x = 1:2; j = x - 1;
    subplot 511
    if x == 1
        hold on
        plot(CP3May.Sleep{1:a(x),2},CP3May.Sleep{1:a(x),6},'blue','linewidth',0.5)
         xlabel('Time')
            x1 = datetime([B{1} '-May-2019 20:00:00'])
            x2 = datetime([B{2} '-May-2019 06:00:00'])
                     xlim ([x1 x2])
                
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP3 May'  B{1}  '-'  B{2} 'Somnogram'])   
    else plot(CP3May.Sleep{a(j):a(x),2},CP3May.Sleep{a(j):a(x),6},'blue','linewidth',0.5) 

    end
 end
 
 for  z = 2:3  j = z-1;
     subplot 512
 
     plot(CP3May.Sleep{a(j):a(z),2},CP3May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                   x1 = datetime([B{2} '-May-2019 21:00:00'])
                   x2 = datetime([B{3} '-May-2019 6:00:00'])
                     xlim ([x1 x2])
                
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
    
                      title(['CP3 May'  B{2} ' - ' B{3}  'Somnogram'])   
                      hold on
    end
    
 for  z = 3:4;  j = z-1;
     subplot 513
     plot(CP3May.Sleep{a(j):a(z),2},CP3May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
                xlabel('Time')
                   x1 = datetime([B{3} '-May-2019 21:00:00'])
                   x2 = datetime([B{4} '-May-2019 6:00:00'])
                     xlim ([x1 x2])
                
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP3 May'  B{3} ' - ' B{4}  'Somnogram'])
                hold on
               
 end   
  
   for  z = 4:5;  j = z-1;
     subplot 514
     plot(CP3May.Sleep{a(j):a(z),2},CP3May.Sleep{a(j):a(z),6},'blue','linewidth',0.5)
         xlabel('Time')
                   x1 = datetime([B{5} '-May-2019 21:00:00'])
                     x2 = datetime([B{6} '-May-2019 4:00:00'])
                    xlim ([x1 x2])
             
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP3 May'  B{5} ' - ' B{6}  'Somnogram'])
hold on
   end 
   % if plot has missing data plot from last z:current z and change lim
  %don't forget hold on if z = ... : ... 
  
  %code doesn't work at end? use number of outputs instead
  
  for  z = 5:6  j = z-1;
     subplot 515
     plot(CP3May.Sleep{a(j):5213,2},CP3May.Sleep{a(j):5213,6},'blue','linewidth',0.5)
                 xlabel('Time')
                   x1 = datetime([B{6} '-May-2019 20:00:00'])
                   x2 = datetime([B{7} '-May-2019 6:00:00'])
                     xlim ([x1 x2])
             
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP3 May'  B{6} '-' B{7}  'Somnogram'])
                hold on

  end  
 %end may 15 -22 
  
 
 
  
%% April - CP3
dt = (CP3Apr.Sleep{:,2});
dt.Format = 'dd';
column1 = cellstr(dt) ;       
dt.Format = 'MMM';
column2 = cellstr(dt); 
dt.Format = 'yyyy';
column3 = cellstr(dt);

% Gives Days of Data set 
B = setdiff(column1, column2);

%find when data swithces day
holdSleepdat = datevec(CP3Apr.Sleep{:,2});
newday = diff(holdSleepdat(:,3));
switchday = find(newday == 1);
 a = switchday;
 

     plot(CP3Apr.Sleep{:,2},CP3Apr.Sleep{:,6},'blue','linewidth',0.5)
              xlabel('Time')
                   x1 = datetime([B{1} '-Apr-2019 20:30:00'])
                   x2 = datetime([B{2} '-Apr-2019 5:30:00'])
                     xlim ([x1 x2])
             
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                    ylim([0.5 7.5])
                         yticklabels({'deep','light','rem','wake'})
                title(['CP3 Apr'  B{1} '-' B{2}  'Somnogram'])


%% CP3 April Steps
%Set up 
holdSleepdat = datevec(CP3Apr.Steps{:,1});
newday = diff(holdSleepdat(:,3));
switchday = find(newday == 1);
a = switchday;
% add a 0 at the end of a for forloop
                     
dt = (CP3Apr.Steps{:,1});
dt.Format = 'dd';
column1 = cellstr(dt) ;       
dt.Format = 'MMM';
column2 = cellstr(dt); 
dt.Format = 'yyyy';
column3 = cellstr(dt);
B = setdiff(column1, column2);
%set up end


%for loop 


    %must add a(j) + 1 so that the previous days input isn't included
    %Must add a 0 at the end of a so that the for loop goes through last x
    
for x = 1:30; j = x - 1;
    if x == 1 
    step(x) = sum(CP3Apr.Steps{1:a(x),2})
    else
        step(x) = sum(CP3Apr.Steps{a(j)+1:a(x),2})
    end
    if x == 30 
        step(x) = sum(CP3Apr.Steps{a(j)+1:720,2})
    end
end

bar(step)
title('CP3 April Steps')
xlabel('Days in April')
ylabel('Steps per Day')

%Checks
    % check using sum of steps for the month  - the days that aren't in the
    % month being used 
        % for ex April has May first so sum of april Steps - May 1 data 
        
    sum(CP3Apr.Steps{1:720,2}
       
    %compared against sum of step
        
    sum(step)
        
       %if the two sum = each other then forloop and bar graph are correct

%% CP3 May Steps
%Set up 
holdSleepdat = datevec(CP3May.Steps{:,1});
newday = diff(holdSleepdat(:,3));
switchday = find(newday == 1);
a = switchday;
% add a 0 at the end of a for forloop
                     
dt = (CP3May.Steps{:,1});
dt.Format = 'dd';
column1 = cellstr(dt) ;       
dt.Format = 'MMM';
column2 = cellstr(dt); 
dt.Format = 'yyyy';
column3 = cellstr(dt);
B = setdiff(column1, column2);
%set up end


%for loop 


    %must add a(j) + 1 so that the previous days input isn't included
    %Must add a 0 at the end of a so that the for loop goes through last x
    
for x = 1:31; j = x - 1;
    if x == 1 
    step(x) = sum(CP3May.Steps{1:a(x),2})
    else
        step(x) = sum(CP3May.Steps{a(j)+1:a(x),2})
    end
    if x == 31 
        step(x) = sum(CP3May.Steps{a(j)+1:744,2})
    end
end

bar(step)
title('CP3 May Steps')
xlabel('Days in May')
ylabel('Steps per Day')

%Checks
    % check using sum of steps for the month  - the days that aren't in the
    % month being used 
        % for ex April has May first so sum of april Steps - May 1 data 
        
    sum(CP3May.Steps{1:744,2})
       
    %compared against sum of step  
  
    sum(step)  
    
       %if the two sum = each other then forloop and bar graph are correct
