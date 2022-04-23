clear all
clc
n = 4;
len = 1000;
msg = randint(4000,1,2,139); % Random data
g1 = poly2trellis(n, [15 13])
gg1 = distspec(g1,6)
a = dec2bin(0,3);
b = dec2bin(1,3);
c = dec2bin(2,3);
d = dec2bin(3,3);
e = dec2bin(4,3);
f = dec2bin(5,3);
g = dec2bin(6,3);
h = dec2bin(7,3);
state = a;
OutOut = zeros(1,16);
output = zeros(1,2);
NS = g1.nextStates;
ns = mat2cell(NS, [8], [1 1]);
ns1= ns{
1,1
};
ns2= ns{
1,2
};
InputMatrix = [1 0 0 1 1 0 0 0]
 
for i= 1:8 %encoding
     
  inp=InputMatrix(1,i);%????? input? ??
        if inp ==0;%input? 0? ??
       
            switch (state) % ?state? ?? output? nextstate??
           
                case (a)
             state = a;
             ouput=[0 0];
           
                case (b)
             state = a;
             output = [1 1];
           
                case (c)
            state = b;
            output = [0 1];
           
                case (d)
            state = b;
            output = [1 0];  
           
                case (e)
            state = c;
            output = [1 0];
           
                case (f)
            state = c;
            output = [0 1];
           
                case (g)
            state = d;
            output = [1 1];
           
                case (h)
            state = d;
            output =[0 0];
       
            end
             
        else inp == 1;%input? 1? ??
        
            switch (state)% ??? ?? nextstate, output??
           
                case (a)
            state = e;
            output = [1 1];
           
                case (b)
            state = e;
            output = [0 0];
           
                case (c)
            state = f;
            output = [1 0];
           
                case (d)
            state = f;
            output = [0 1];
           
                case (e)
            state = g;
            output = [0 1];
           
                case (f)
            state = g;
            output = [1 0];
           
                case (g)
            state = h;
            output = [0 0];
           
                case (h)
            state = h;
            output = [1 1];
        
            end
             
        end
        
     o1 = output(1,1);
     o2 = output(1,2);
     OutOut(1, 2*i-1) = o1;
     OutOut(1, 2*i) = o2;%output? ???? ?? ???? ??
    end
%Decoding   
Encodata = OutOut';
Ecode =  mod(Encodata + randint(16,1),2);
codeded = convenc(InputMatrix,g1); % Encode.
Decodederror = vitdec(Ecode, g1, 1,'trunc','hard');
Decoded21 = Decodederror'
Decoded = vitdec(Encodata, g1, 1,'trunc','hard');
Decoded213 = Decoded'
 
 
 
code = convenc(msg,g1); % Encode the data.
ncode = rem(code + randerr(8*len,1,[0 1;.96 .04]),2); % Add noise.
decoded= vitdec(ncode,g1,34,'cont','hard'); % Decode.
[number,ratio] = biterr(decoded(68+1:end),msg(1:end-68));
