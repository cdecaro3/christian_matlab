function ratio = CdPenetration(material, path_length, energy)
% get the percentage of photons that penetrate through an object
% 
% ratio: percent of photons penetrated (N/N0)
% material: ['CdTe', 'CsI', 'Cu', etc.]
% path_length: path length of beam through material (cm)
% energy: photon energy (keV)


ratio = exp(- CdGetLinearAttenuation(material,energy) * path_length);


end