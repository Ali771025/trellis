clc;
m = 5;
trellis2 = poly2trellis(m, [27 23])
gg2 = distspec(trellis2,6)
len = 1000;
msg = randint(4000,1,2,139); % Random data
a = dec2bin(0,4);
b = dec2bin(1,4);
c = dec2bin(2,4);
d = dec2bin(3,4);
e = dec2bin(4,4);
f = dec2bin(5,4);
g = dec2bin(6,4);
h = dec2bin(7,4);
i = dec2bin(8,4);
j = dec2bin(9,4);
k = dec2bin(10,4);
l = dec2bin(11,4);
m = dec2bin(12,4);
n = dec2bin(13,4);
o = dec2bin(14,4);
p = dec2bin(15,4);
state = a;
OutOut = zeros(1,20);
output = zeros(1,2);
NS = trellis2.nextStates;
ns = mat2cell(NS, 16, [1 1]);
ns1= ns{
1,1
};
ns2= ns{
1,2
};
InputMatrix = [0 0 1 0 1 1 0 0 0 0]
 
for z= 1:10 %encoding
     
  inp=InputMatrix(1,z);%????? input? ??
     if inp ==0;
      switch (state)
          case (a)
              state = a;
              output = [0 0];
               
          case (b)
              state = a;
              output = [1 1];
               
          case (c)
              state = b;
              output = [1 1];
               
          case (d)
              state = b;
              output = [0 0];
               
          case (e)
              state = c;
              output = [1 0];
               
          case (f)
              state = c;
              output = [0 1];
               
          case (g)
              state = d;
              output = [0 1];
               
          case (h)
              state = d;
              output = [1 0];
               
          case (i)
              state = e;
              output = [0 0];
               
          case (j)
              state = e;
              output = [1 1];
               
          case (k)
              state = f;
              output = [1 1];
               
          case (l)
              state = f;
              output = [0 0];
               
          case (m)
              state = g;
              output = [1 0];
               
          case (n)
              state = g;
              output = [0 1];
               
          case (o)
              state = h;
              output = [0 1];
               
          case (p)
              state = h;
              output = [1 0];
               
      end
  else inp == 1;
      switch (state)
          case (a)
              state = i;
              output = [1 1];
               
          case(b);
              state = i;
              output = [0 0];
               
          case(c)
              state = j;
              output = [0 0];
               
          case(d)
              state = j;
              output = [1 1];
               
          case(e)
              state = k;
              output = [0 1];
               
          case(f)
              state = k;
              output = [1 0];
               
          case(g)
              state = l;
              output = [1 0];
               
          case(h)
              state = l;
              output = [0 1];
               
          case(i)
              state = m;
              output = [1 1];
               
          case(j)
              state = m;
              output = [0 0];
               
          case(k)
              state = n;
              output = [0 0];
               
          case(l)
              state = n;
              output = [1 1];
               
          case(m)
              state = o;
              output = [0 1];
               
          case(n)
              state = o;
              output = [1 0];
               
          case(o)
              state = p;
              output = [1 0];
               
          case(p)
              state = p;
              output = [0 1];
      end
     end
      
  o1 = output(1,1);
  o2 = output(1,2);
  OutOut(1, 2*z-1) = o1;
  OutOut(1, 2*z) = o2;  %output? ???? ?? ???? ??
end
 
%Decoding   
Encodata = OutOut';
Ecode =  mod(Encodata + randint(20,1),2);
Codeded = convenc(InputMatrix,trellis2); % Encode.
Decodederror = vitdec(Ecode, trellis2, 1,'trunc','hard');
Decodederror = Decodederror'
Decoded = vitdec(Encodata, trellis2, 1,'trunc','hard');
Decoded11 = vitdec(Codeded, trellis2, 1,'trunc','hard');
Decodednoerror = Decoded'
 
code1 = convenc(msg,trellis2); % Encode the data.
ncode = rem(code1 + randerr(8*len,1,[0 1;.96 .04]),2); % Add noise.
decoded2= vitdec(ncode,trellis2,34,'cont','hard'); % Decode.
[number,ratio] = biterr(decoded2(68+1:end),msg(1:end-68));
Expand>