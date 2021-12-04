def zamiana(n,sys):
    nowy = ""
    chars = "0123456789ABCDE"
    while n>0:
        nowy += chars[n%sys]
        n //=sys
    return nowy[::-1]

print(zamiana(13,2))