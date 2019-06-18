%%LOADING   
 addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data')
        cd('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data');
        load('CPx.mat')
            
            % CPx.mat code
                    %for x = 1:4 
                    %load('CPx.mat')
                    %end
    
        %% 
%CPx.matcode 
    
    %CP4
    addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP4\processed\01-Apr-2019')
        CP3May = open('01-Apr-2019_fitbitdata.mat')
        CP3May = CP3May.fitbitdata
        
    addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP4\processed\01-May-2019')
        CP3May = open('01-May-2019_fitbitdata.mat')
        CP3May = CP3May.fitbitdata

     %CP3
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP3\processed\02-Apr-2019')
        CP3May =  open('02-Apr-2019_fitbitdata.mat')
        CP3May = CP3May.fitbitdata 
        
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP3\processed\01-May-2019')
        CP3May = open('01-May-2019_fitbitdata.mat')
        CP3May = CP3May.fitbitdata
        
   
     %CP2
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP2\processed\01-Apr-2019')
        CP2Apr = open('01-Apr-2019_fitbitdata.mat')
        CP2Apr = CP2Apr.fitbitdata
        
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP2\processed\02-May-2019')
        CP2May = open('02-May-2019_fitbitdata.mat')
        CP2May = CP2May.fitbitdata
        
     addpath('C:\Users\adela\Dropbox (Brown)\For Adela\FitBit Data\CP2\processed\01-Feb-2019')
        CP3May = open('01-Feb-2019_fitbitdata.mat')
        CP3May = CP3May.fitbitdata
        
    
        
            
        
 %% Adds Sleep Stage Levels



for i = 1: length(CP3May.Sleep{:,5})   
        
    if strcmp(CP3May.Sleep{i,3}{1},'light')
            CP3May.Sleep{i,6} = 3
        
        elseif strcmp(CP3May.Sleep{i,5}{1}, 'deep')
               CP3May.Sleep{i,6} = 1
       
        elseif strcmp(CP3May.Sleep{i,5}{1}, 'wake')
                CP3May.Sleep{i,6} = 7
       
        elseif strcmp(CP3May.Sleep{i,5}{1}, 'rem')
                CP3May.Sleep{i,6} = 6
    
                
   
        end 
end

 %% plotting sleep data
%fig.Color = [1 0.4 0.6]; PINK!
%Purple [0.4940 0.1840 0.5560]
%[0.4660 0.6740 0.1880] green


load('CP4Apr.mat')
load('CP4May.mat')
load('CP3Apr.mat')
load('CP3May.mat')

plot(CP3May.Sleep{:,2},CP3May.Sleep{:,6},'color',[1 0.4 0.6])

   title ('CP3 April Somnogram')
                xlabel('Date')
                ylabel('Sleep Stage') 
                    yticks([1 3 6 7])
                         yticklabels({'deep','light','rem','wake'})
                    
      
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
    x1 = stim(i)1
    
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
 
    

    
d = CP4AprSleepStage{:,6} ~=0;
Deep = CP4AprSleepStage{:,6};
DateS = CP4AprSleepStage{:,1}; 
    
    plot(DateS(d),Deep(d),'black')
    

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



plot(CP3May.Steps{:,1},CP3May.Steps{:,2})
   title ('CP4 Steps for April')
                xlabel('Date')
                ylabel('Steps')
                
    
              

%% subplotting for Sleep Log
subplot 211 
   plot(CP3May.SleepLog{:,1},CP3May.SleepLog{:,4},'color',[0.4940 0.1840 0.5560])
        xlabel ('Date')
        ylabel ('Efficiency')
        title('CP4 April Sleep Efficiency')

subplot 212
   
    plot (CP3May.SleepLog{:,1},CP3May.SleepLog{:,7},'blue')
    
    hold on;
    
    plot (CP3May.SleepLog{:,1},CP3May.SleepLog{:,9},'color',[0.4660 0.6740 0.1880])
        xlabel ('Date')
            
        ylabel ('Minutes')
        
        
        legend ({'Minutes Asleep', 'Minutes in Bed'})
   
    title('CP4 April Minutes Asleep vs. Minutes in Bed')
        
    


legend ({plot1, plot2, plot3}
xlabel ('')
ylabel ('')
%xlim([50 100])
%ylim ([0 10])



