var a;
a = argument0
if (a < power(10, 3))
    return string(a);
if (a < power(10, 6))
    return (string((a / power(10, 3))) + "k");
if (a < power(10, 9))
    return (string((a / power(10, 6))) + "m");
if (a < power(10, 12))
    return (string((a / power(10, 9))) + "b");
if (a < power(10, 15))
    return (string((a / power(10, 12))) + "t");
return (string((a / power(10, 15))) + "q");
