switch argument0
{
    case "basic":
        return array(1, "machine", "twin", "pounder", "sniper", "flank", "manager");
    case "manager":
        return array(2, "overseer", "cruiser");
    case "overseer":
        return array(3, "overlord", "overtrap");
    case "cruiser":
        return array(3, "carrier", "battle", "defend");
    case "pounder":
        return array(2, "destroy", "artillery", "builder");
    case "destroy":
        return array(3, "anni", "hotshot", "destroygun", "wubdub", "hybrid");
    case "artillery":
        return array(3, "spread", "mortar");
    case "builder":
        return array(3, "construct", "boombuild");
    case "twin":
        return array(2, "triplet", "bent", "double", "gunner");
    case "triplet":
        return array(3, "quint", "dual", "battle");
    case "bent":
        return array(3, "penta", "doublebent", "bentblaster");
    case "double":
        return array(3, "doublebent", "doubledouble", "doubletrap");
    case "gunner":
        return array(3, "heavy", "mortar");
    case "flank":
        return array(2, "hexa", "tri", "trap");
    case "trap":
        return array(3, "guntrap", "rifletrap", "doubletrap", "bomber", "defend");
    case "hexa":
        return array(3, "octo", "duodeca", "wubdub");
    case "tri":
        return array(3, "fighter", "booster", "bomber");
    case "sniper":
        return array(2, "hunter", "assass", "rifle");
    case "rifle":
        return array(3, "rifletrap", "longrifle", "multirifle");
    case "hunter":
        return array(3, "preda", "poach");
    case "assass":
        return array(3, "ranger", "buttbutt");
    case "machine":
        return array(2, "blaster", "gatling", "ministream", "doublemach");
    case "blaster":
        return array(3, "bentblaster", "machblaster", "flame");
    case "ministream":
        return array(3, "stream", "hotshot");
    case "gatling":
        return array(3, "sprayer", "howitzer");
    case "doublemach":
        return array(3, "triplemach", "halfnhalf");
    default:
        return 0;
}

