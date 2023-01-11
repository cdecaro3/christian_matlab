function mu = CdGetLinearAttenuation(material, energy)
% mu = CdGetLinearAttenuation(material, energy)
% 
% get linear attenuation coefficient for a given material and energy
%
% mu: linear attenuation coefficient (1/cm)
% material: ['CdTe', 'CsI', 'Cu', etc.]
% energy: photon energy (keV)

material = CdEquivalentName(material);

file = importdata('material_densities.txt');
idx = find(matches(file.rowheaders,material));
density = file.data(idx); % g/cm^3
mass_atten = CdGetMassAttenuation(material,energy);

mu = density * mass_atten;


end