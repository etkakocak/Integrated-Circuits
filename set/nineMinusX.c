#include <stdbool.h>

bool not(bool x) {
    return !x;
}

bool u4(bool x4, bool x3, bool x2) {
    return not(x4) && not(x3) && not(x2);
}

bool u3(bool x2, bool x4, bool x3) {
    return not(x2) && not(x4) && x3 || x2 && not(x4) && not(x3);
}

bool u2(bool x2, bool x4) {
    return x2 && not(x4);
}

bool u1(bool x1, bool x4, bool x2, bool x3) {
    return not(x1) && not(x4) || not(x2) && not(x1) && not(x3);
}

bool BCD(bool x4, bool x2, bool x3) {
    return not(x4) || not(x2) && x4 && not(x3);
}

