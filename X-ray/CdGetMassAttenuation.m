function mu_rho = CdGetMassAttenuation(material, energy)
% get mass attenuation coefficient (mu / rho) for a material at an energy
% total attenuation with coherent scattering
%
% mu_rho: mass attenuation coefficient (mu / rho) (cm^2/g)
% material: ['CdTe', 'CsI', 'Cu', etc.]
% energy: photon energy (keV)

energy = energy / 1000; %convert to MeV

file = importdata(sprintf("NIST_XCOM_data/%s.txt", material));

[~,ia,~] = unique(file.data(:,1),'last'); % get indices of uniques 
duplicate_idx = setdiff(1:numel(file.data(:,1)), ia); % get indices of first duplicates
file.data(duplicate_idx,1) = file.data(duplicate_idx,1) - 0.0000000001; % slightly offset first duplicates
mu_rho = interp1(file.data(:,1), file.data(:,7), energy);

% --- to create energy grid to input into xcom along with standard grid (for adding new material data)---
% fprintf('\n')
% for idx = 0.001:0.002:0.200
%     fprintf('%d\n',idx)
% end

end