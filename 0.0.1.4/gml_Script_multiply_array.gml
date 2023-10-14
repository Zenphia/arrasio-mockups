var _output, len, n, _input, i;
_output = argument[0]
len = array_length_1d(_output)
for (n = 1; n < argument_count; n++)
{
    _input = argument[n]
    for (i = 0; i < len; i++)
        _output[i] = (_output[i] * _input[i])
}
return _output;
