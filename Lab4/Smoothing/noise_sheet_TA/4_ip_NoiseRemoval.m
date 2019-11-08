%==== Problem 1 , sheet noise removal
A = ones(11,11);
A(3:9, 3:9) = zeros(7,7);
A(6,6) = 1;

figure (1);
imshow(A);

LP_Filter = [1/9 1/9 1/9 ; 1/9 1/9 1/9; 1/9 1/9 1/9];

res1 = imfilter(A,LP_Filter)
figure (2);
imshow(res1);
%===========================================
HP_Filter = [1 1 1 ; 1 -8 1; 1 1 1];
res2 = imfilter(A,HP_Filter)
figure (3);
imshow(res2);

%==========================================
res3 = medfilt2(A, [3 3])
figure (4);
imshow(res3);

%==========================================
%============ problem 2 sheet Noise removal
%=========================================
h1 = [1 1 ; 1 1 ];
h2 = [1 1 1 ; 1 1 1; 1 1 1];

E_res1 = imerode(A, h1)
figure (5);
imshow(E_res1);
E_res2 = imerode(A, h2)
figure (6);
imshow(E_res2);

% the other image 
B = A;
B(5:7, 5:7) = ones(3,3);

E_res3 = imerode(B, h1)
E_res4 = imerode(B, h2)