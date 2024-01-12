%% Construction of MCN
close all
clear all
clc
SavePath='***\MCN\';mkdir(SavePath);
load('***\sMRI_features.mat');
load('***\dMRI_features.mat');
load('***\fMRI_features.mat');
load('***\EEG_features.mat');
% Z-score
for sub=1:size(DTI_FA,1)
    Feature(1,sub,:) = (DTI_FA(sub,:)-mean(DTI_FA(sub,:)))/std(DTI_FA(sub,:));
    Feature(2,sub,:) = (DTI_MD(sub,:)-mean(DTI_MD(sub,:)))/std(DTI_MD(sub,:));
    Feature(3,sub,:) = (T1_CT(sub,:)-mean(T1_CT(sub,:)))/std(T1_CT(sub,:));
    Feature(4,sub,:) = (T1_CI(sub,:)-mean(T1_CI(sub,:)))/std(T1_CI(sub,:));
    Feature(5,sub,:) = (T1_SA(sub,:)-mean(T1_SA(sub,:)))/std(T1_SA(sub,:));
    Feature(6,sub,:) = (T1_MC(sub,:)-mean(T1_MC(sub,:)))/std(T1_MC(sub,:));
    Feature(7,sub,:) = (T1_GC(sub,:)-mean(T1_GC(sub,:)))/std(T1_GC(sub,:));
    Feature(8,sub,:) = (T1_GM(sub,:)-mean(T1_GM(sub,:)))/std(T1_GM(sub,:));
    Feature(9,sub,:) = (T1_FI(sub,:)-mean(T1_FI(sub,:)))/std(T1_FI(sub,:));
    Feature(10,sub,:) = (fMRI_ReHo(sub,:)-mean(fMRI_ReHo(sub,:)))/std(fMRI_ReHo(sub,:));
    Feature(11,sub,:) = (fMRI_ALFF(sub,:)-mean(fMRI_ALFF(sub,:)))/std(fMRI_ALFF(sub,:));
    Feature(12,sub,:) = (fMRI_fALFF(sub,:)-mean(fMRI_fALFF(sub,:)))/std(fMRI_fALFF(sub,:));
    Feature(13,sub,:) = (EEG_BC(sub,:)-mean(EEG_BC(sub,:)))/std(EEG_BC(sub,:));  
    Feature(14,sub,:) = (EEG_CC(sub,:)-mean(EEG_CC(sub,:)))/std(EEG_CC(sub,:));
    Feature(15,sub,:) = (EEG_DC(sub,:)-mean(EEG_DC(sub,:)))/std(EEG_DC(sub,:));
    Feature(16,sub,:) = (EEG_EC(sub,:)-mean(EEG_EC(sub,:)))/std(EEG_EC(sub,:));
end
% MCN construction by Pearson's correlation
for sub=1:size(Feature,2)
    for m=1:size(Feature,3)
        for n=1:size(Feature,3)
            IndexROI1=squeeze(Feature(:,sub,m));
            IndexROI2=squeeze(Feature(:,sub,n));
            [r,p] = corr(IndexROI1,IndexROI2);
            MCN(sub,m,n)=r;
        end
    end
end
save([SavePath,'MCN.mat'],'MCN');

