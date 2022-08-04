import re

bare2high = dict(zip("aeiou","áéíóú"))
bare2low = dict(zip("aeiou","àèìòù"))

def gen_trans(cvc_root, gloss):
    v = re.search("[aeiou]", cvc_root).group()
    aps_root = cvc_root.replace(v, f"{bare2high[v]}{v}")
    pss_root = cvc_root.replace(v, f"{v}'{v}")
    mv_root = cvc_root.replace(v, f"{bare2low[v]}{v}")

    print(f"""
! {gloss}
{cvc_root}%<v%>%<tv%>:{cvc_root} TransVozActiva ;
{cvc_root}%<v%>%<iv%>%<aps%>:{aps_root}%> TransVozAntipasiva ;
{cvc_root}%<v%>%<iv%>%<pss%>:{pss_root}%> TransVozPasiva ;
{cvc_root}%<v%>%<iv%>%<mv%>:{mv_root}%> TransVozMedia ;
""") #.format(gloss, cvc_root, cvc_root, cvc_root, aps_root, cvc_root, pss_root, cvc_root, mv_root))

if __name__ == "__main__":
    with open("../maya_verbs/transitive_verbs.csv") as f:
        for line in f:
            line = line.rsplit(",", 1)[0]
            cvc_root, gloss = line.split(",", 1)
            gen_trans(cvc_root, gloss)