var xinital1, yinital1, xinital2, yinital2, xfinal1, yfinal1, xfinal2, yfinal2, buffer, tmin, tmax, AA, BB, CC, DD, sqrAA, sqrBB, sqrCC, sqrDD, AB, CD, A, B, C, det, t1, t2;
xinital1 = argument0
yinital1 = argument1
xinital2 = argument2
yinital2 = argument3
xfinal1 = (argument4 + xinital1)
yfinal1 = (argument5 + yinital1)
xfinal2 = (argument6 + xinital2)
yfinal2 = (argument7 + xinital2)
buffer = argument8
tmin = min(argument9, argument10)
tmax = 1
AA = (xinital1 - xinital2)
BB = (xfinal2 - xfinal1)
CC = (yinital1 - yinital2)
DD = (yfinal2 - yfinal1)
sqrAA = sqr(AA)
sqrBB = sqr(BB)
sqrCC = sqr(CC)
sqrDD = sqr(DD)
AB = (AA * BB)
CD = (CC * DD)
A = (((((sqrAA - (2 * AB)) + sqrBB) + sqrCC) - (2 * CD)) + sqrDD)
B = (((AB - sqrAA) + CD) - sqrCC)
C = ((sqrAA + sqrCC) - buffer)
det = ((B * B) - ((4 * A) * C))
if (A == 0 || det < 0)
    return 0;
t1 = (((-B) - sqrt(det)) / (2 * A))
t2 = (((-B) + sqrt(det)) / (2 * A))
if (t1 <= tmin || t1 > tmax)
{
    if (t2 <= tmin || t2 > tmax)
        return 0;
    return t2;
}
if (t2 > tmin && t2 <= tmax)
    return min(t1, t2);
return t1;
