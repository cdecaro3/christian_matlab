clear
clc

DICOM_folders = dir;
DICOM_folders = DICOM_folders(startsWith({DICOM_folders.name},'DICOM') & [DICOM_folders.isdir]);
num_DICOM_folders = length(DICOM_folders);

for i=1:num_DICOM_folders
    DICOM_folder_name = [DICOM_folders(i).name '\'];
    PA_folders = dir([DICOM_folder_name 'PA*']);
    num_PA_folders = length(PA_folders);
    
    for j=1:num_PA_folders
        PA_folder_name = [DICOM_folder_name PA_folders(j).name '\'];
        ST_folders = dir([PA_folder_name 'ST*']);
        num_ST_folders = length(ST_folders);
        
        for k=1:num_ST_folders
            ST_folder_name = [PA_folder_name ST_folders(k).name '\'];
            SE_folders = dir([ST_folder_name 'SE*']);
            num_SE_folders = length(SE_folders);
            
            for l=1:num_SE_folders
                SE_folder_name = [ST_folder_name SE_folders(l).name '\'];
                image_files = dir([SE_folder_name 'IM*']);
                
                header = dicominfo([SE_folder_name image_files(1).name],'UseDictionaryVR',true); 
                patient_name = header.PatientName;
                
                
                description = erase(header.SeriesDescription,'/');
                description = erase(description,'\');
                series = [header.SeriesNumber];
                series = num2str(series);
                destination = [patient_name.FamilyName '\' series '_' description '\'];
                
                mkdir(destination);
                copyfile([SE_folder_name 'IM*'],destination);
                
            end
            
        end
        
    end
     rmdir(DICOM_folder_name, 's');
end
