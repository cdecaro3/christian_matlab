function ratio = CdAttenuation(material, path_length, energy)
% get the percentage of photons that are attenuated in an object
% 
% ratio: percent of photons attenuated (1 - (N/N0))
% material: ['CdTe', 'CsI', 'Cu', etc.]
% path_length: path length of beam through material (cm)
% energy: photon energy (keV)


ratio = exp(- CdGetLinearAttenuation(material,energy) * path_length);


end