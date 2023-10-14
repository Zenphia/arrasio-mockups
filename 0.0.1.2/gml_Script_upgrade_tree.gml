switch argument0
{
    case "basic":
        return array(1, "machine", "twin", "pounder", "sniper", "flank");
    case "pounder":
        return array(2, "destroy", "artillery");
    case "destroy":
        return array(3, "anni", "hotshot", "destroygun", "wubdub");
    case "artillery":
        return array(3, "spread", "mortar");
    case "twin":
        return array(2, "triplet", "bent", "double", "gunner");
    case "triplet":
        return array(3, "quint", "dual");
    case "bent":
        return array(3, "penta", "doublebent", "bentblaster");
    case "double":
        return array(3, "doublebent", "doubledouble");
    case "gunner":
        return array(3, "heavy", "mortar");
    case "flank":
        return array(2, "hexa", "tri");
    case "hexa":
        return array(3, "octo", "duodeca", "wubdub");
    case "tri":
        return array(3, "fighter", "booster");
    case "sniper":
        return array(2, "hunter", "assass");
    case "hunter":
        return array(3, "preda");
    case "assass":
        return array(3, "ranger", "buttbutt");
    case "machine":
        return array(2, "blaster", "gatling", "ministream", "doublemach");
    case "blaster":
        return array(3, "bentblaster", "machblaster");
    case "ministream":
        return array(3, "stream", "hotshot");
    case "gatling":
        return array(3, "sprayer");
    case "doublemach":
        return array(3, "triplemach", "halfnhalf");
    default:
        return 0;
}

