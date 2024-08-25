%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solving the QRE and Symmetric QRE problems and comparing the running times.

%% Copyright (c) 2024, by 
%% Mehdi Karimi
%% Levent Tuncel
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars Z A b cons;

 
 cons{1,1}='QRE';
 k = 10;
 cons{1,2}=[k];
 AtX=[];
 AtY=zeros(k^2,k);
 AtY=[];
 for i=1:k
    temp = zeros(k,k);
    temp(i,i) = 1;
    AtX = [AtX sm2vec(temp)];
    AtY = [AtY sm2vec(temp)];
 end

 AtX = []; % [sm2vec(ones(k))];
 AtY = []; % [sm2vec(ones(k))];
 
 for i=1:k
     ti = randi([1 k], 1,1);
     while ti == i
          ti = randi([1 k], 1,1);
     end
     temp = zeros(k,k);
     temp(i,ti) = 1; temp(ti,i) = 1;
     AtX=[AtX sm2vec(temp)];
     
     ti = randi([1 k], 1,1);
     while ti == i
          ti = randi([1 k], 1,1);
     end
     temp = zeros(k,k);
     temp(i,ti) = 1; temp(ti,i) = 1;
     AtY=[AtY sm2vec(temp)];
 end
 
 [m,n]=size(AtX);

 At=[zeros(1,n) 1; AtX zeros(m,1); AtY zeros(m,1)];

 A{1,1}= sparse(At);
 % b{1,1}= [20;sparse(zeros(m,1)); sm2vec(speye(k))];
 b{1,1}= [0; sm2vec(speye(k)); sm2vec(speye(k))];
 
 cons{2,1} = 'LP';
 cons{2,2} = [k];
 % A{2,1} = sparse([zeros(k,k) eye(k,k) zeros(k,1)]);
 A{2,1} = sparse([eye(k,k) zeros(k,1)]);
 b{2,1} = sparse(2*ones(k,1));


 c=[zeros(n,1); 1];


 [x,y,info]=DDS(c,A,b,cons);
 info.time
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%% symmetric QRE

 At1=[zeros(1,n) 1 0; AtX zeros(m,2); AtY zeros(m,2)];
 At2=[zeros(1,n) 0 1; AtY zeros(m,2); AtX zeros(m,2)];
 

 cons{1,1}='QRE';
 cons{1,2}=[k];

 A{1,1}= sparse(At1);
 % b{1,1}= [20;sparse(zeros(m,1)); sm2vec(speye(k))];
 b{1,1}= [0; sm2vec(speye(k)); sm2vec(speye(k))];

 cons{2,1}='QRE';
 cons{2,2}=[k];

 A{2,1}= sparse(At2);
 % b{1,1}= [20;sparse(zeros(m,1)); sm2vec(speye(k))];
 b{2,1}= [0; sm2vec(speye(k)); sm2vec(speye(k))];


 cons{3,1} = 'LP';
 cons{3,2} = [k];
 % A{2,1} = sparse([zeros(k,k) eye(k,k) zeros(k,1)]);
 A{3,1} = sparse([eye(k,k) zeros(k,2)]);
 b{3,1} = sparse(2*ones(k,1));


 c=[zeros(n,1); 1; 1];


 [x,y,info]=DDS(c,A,b,cons);
 
 info.time