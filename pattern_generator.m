% Scanning light sheet pattern generator for DMD

% Pattern directory

cd '.\Patterns'

% Micromirror array dimensions
array_height = 1920; %[px]
array_width = 1080; %[px]

buffer_apriori = 400;
buffer_aposteriori = 400;

ls_width = 3; %Light sheet width [px]

displacement = 1; % Light sheet displacement [px]

number_of_lightsheets = (array_width/displacement) - ls_width + 1;

for i=buffer_apriori:number_of_lightsheets-buffer_aposteriori
    pattern = zeros(array_width, array_height);
    
    for j=1:ls_width
        pattern(i + j - 1,:) = 1;
    end
    
    name = strcat(num2str(i), '.tif')
    imwrite(pattern, name, 'tif');
end

cd ..
