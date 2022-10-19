function ratio = CdPenetration(material_filters, energy)
% get the percentage of photons that penetrate through an object
%
% ratio: percent of photons penetrated (N/N0)
% material_filters: material and pathlength
%   material: ['CdTe', 'CsI', 'Cu', etc.]
%   pathlength: path length of beam through material (cm)
%   i.e. CdPenetration({'Cu' 0.1; 'H2O' 5}, 70)
% energy: photon energy (keV)

ratio = 1;

for idx = 1:size(material_filters,1)
    ratio = ratio * exp(- ...
        CdGetLinearAttenuation(material_filters{idx,1},energy) * ...
        material_filters{idx,2});
end

end