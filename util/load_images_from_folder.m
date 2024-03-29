function [ Is ] = load_images_from_folder( img_path, img_type)

	images = dir([img_path img_type]);
	s = numel(images);
	Is = cell(1, s);
	for i = 1:s    
		Is{i} = rgb2gray(imread([img_path images(i).name]));        
    end
end
