#fopen bn "Nblue_temp.dat" read
#read(bn,Nblue)
#fopen rn "Nred_temp.dat" read
#read(rn,Nred)
#if (Nblue!=0)
#declare bpcoord=array[Nblue];
#end
#if (Nred!=0)
#declare rpcoord=array[Nred];
#end

#declare xa=1;
#declare ya=1;
#declare za=1;

background { color rgb<0,0,0> }

#if (Nblue!=0)
#fopen BPts "blue_temp.dat" read
#declare ib=0;
#while (defined(BPts))
    #read(BPts,vec1)
    #declare bpcoord[ib]=vec1;
    #declare ib=ib+1;
#end
#end

#if (Nred!=0)
#fopen RPts "red_temp.dat" read
#declare ir=0;
#while (defined(RPts))
    #read(RPts,vec1)
    #declare rpcoord[ir]=vec1;
    #declare ir=ir+1;
#end
#end

camera {
  location  <0,0,2.25>
  look_at  <0,0,0>
  right <-4/3,0,0>
  up <0,0,1>
  sky <0,0,1>
}

light_source { <0,0,5> color rgb<1,1,1> }

#if (Nblue!=0)
#declare j=0;
#while(j < ib)
sphere {
  bpcoord[j] , 0.005
  pigment { color rgb <0,0,1> }
  finish { metallic }
}
#declare j=j+1;
#end
#end

#if (Nred!=0)
#declare j=0;
#while(j < ir)
sphere {
  rpcoord[j] , 0.005
  pigment { color rgb <1,0,0> }
  finish { metallic }
}
#declare j=j+1;
#end
#end
