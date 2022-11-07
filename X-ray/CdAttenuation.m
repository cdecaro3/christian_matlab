function ratio = CdAttenuation(material_filters, energy)
% ratio = CdAttenuation(material_filters, energy)
% 
% get the percentage of photons that are attenuated in an object
% 
% ratio: percent of photons attenuated (1 - (N/N0))
% material_filters: material and pathlength
%   material: ['CdTe', 'CsI', 'Cu', etc.]
%   pathlength: path length of beam through material (cm)
%   i.e. CdAttenuation({'Cu' 0.1; 'H2O' 5}, 70)
% energy: photon energy (keV)


ratio = 1 - CdPenetration(material_filters, energy);


end