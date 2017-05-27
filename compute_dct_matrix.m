% This function returns an extended version of the 8x8 quantization matrix
% used in JPEQ compression. The matrix is extended to a 16x16 matrix
% according to empirical evidence provided in Fridrich et al - 
%   J.Fridrich, D. Soukal, and J. Lukas. Detection of Copy-Move Forgery in 
%   digital Images. Proc. Of Digital Forensic Research Workshop, Aug. 2003. 


function Q_16x16 = compute_dct_matrix()
 
%This is the standard jpeg quantization matrix.
% according to Fridrich's paper, this matrix needs to be extended to a
% 16x16 quantization matrix 

Q_8x8 =[ 4, 4, 6, 11, 24, 24, 24, 24 ;
		  4, 5, 6, 16, 24, 24, 24, 24 ;
		  6, 6, 14, 24, 24, 24, 24, 24;
		  11, 16, 24, 24, 24, 24, 24, 24;
		  24, 24, 24, 24, 24, 24, 24, 24;
		  24, 24, 24, 24, 24, 24, 24, 24;
		  24, 24, 24, 24, 24, 24, 24, 24;
		  24, 24, 24, 24, 24, 24, 24, 24; ];
                                             
% first adjust the 8x8 matrix so that it is about 2 times its original
% "size"

Q_8x8_prime = Q_8x8;
Q_8x8_prime(1,1) = 2*Q_8x8_prime(1,1);
Q_8x8_prime(2:8,2:8) = 2.5*Q_8x8_prime(2:8,2:8);%Top left corner block
Q_18 = zeros(8,8) + 2.5*Q_8x8(1,8); %top right corner block
Q_81 = zeros(8,8) + 2.5*Q_8x8(8,1); %bottom left corner block
Q_88 = zeros(8,8) + 2.5*Q_8x8(8,8); %bottom right corner block

%Q_16x16 is the concactenation of all of the blocks described above
Q_16x16 = vertcat(horzcat(Q_8x8_prime, Q_18),horzcat(Q_81, Q_88));
end
