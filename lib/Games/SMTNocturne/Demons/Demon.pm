package Games::SMTNocturne::Demons::Demon;
use strict;
use warnings;

use JSON::PP;

my %DEMONS_BY_NAME = %{ decode_json(do { local $/; <DATA> }) };
for my $name (keys %DEMONS_BY_NAME) {
    $DEMONS_BY_NAME{$name}{name} = $name;
    $DEMONS_BY_NAME{$name} = bless $DEMONS_BY_NAME{$name}, __PACKAGE__;
}

my %DEMONS_BY_TYPE;
for my $name (keys %DEMONS_BY_NAME) {
    my $demon = $DEMONS_BY_NAME{$name};
    push @{ $DEMONS_BY_TYPE{$demon->type} ||= [] }, $demon;
}
for my $type (keys %DEMONS_BY_TYPE) {
    my $demons = $DEMONS_BY_TYPE{$type};
    @$demons = sort { $a->level <=> $b->level } @$demons;
}

sub from_name {
    my ($class, $name) = @_;

    die "unknown demon $name" unless $DEMONS_BY_NAME{$name};

    return $DEMONS_BY_NAME{$name};
}

sub from_type_and_level {
    my ($class, $type, $level) = @_;

    die "unknown type $type" unless $DEMONS_BY_TYPE{$type};

    my $found;
    for my $demon (@{ $DEMONS_BY_TYPE{$type} }) {
        $found = $demon;
        last if $demon->level >= $level;
    }

    return $found;
}

# sub boss        { $_[0]->{boss} }
sub fusion_type { $_[0]->{fusion_type} }
sub level       { $_[0]->{level} }
sub type        { $_[0]->{type} }

1;

__DATA__
{
   "Abaddon" : {
      "fusion_type" : "normal",
      "level" : "69",
      "type" : "Tyrant"
   },
   "Aciel" : {
      "fusion_type" : "evolve",
      "level" : "77",
      "type" : "Tyrant"
   },
   "Aeros" : {
      "fusion_type" : "normal",
      "level" : "11",
      "type" : "Element"
   },
   "Albion" : {
      "fusion_type" : "evolve",
      "level" : "64",
      "type" : "Entity"
   },
   "Amaterasu" : {
      "fusion_type" : "special",
      "level" : "56",
      "type" : "Deity"
   },
   "Angel" : {
      "fusion_type" : "normal",
      "level" : "11",
      "type" : "Divine"
   },
   "Apsaras" : {
      "fusion_type" : "normal",
      "level" : "8",
      "type" : "Yoma"
   },
   "Aquans" : {
      "fusion_type" : "normal",
      "level" : "15",
      "type" : "Element"
   },
   "Ara Mitama" : {
      "fusion_type" : "normal",
      "level" : "25",
      "type" : "Mitama"
   },
   "Arahabaki" : {
      "fusion_type" : "normal",
      "level" : "30",
      "type" : "Vile"
   },
   "Archangel" : {
      "fusion_type" : "normal",
      "level" : "18",
      "type" : "Divine"
   },
   "Atavaka" : {
      "fusion_type" : "normal",
      "level" : "47",
      "type" : "Deity"
   },
   "Atropos" : {
      "fusion_type" : "normal",
      "level" : "67",
      "type" : "Femme"
   },
   "Badb Catha" : {
      "fusion_type" : "normal",
      "level" : "23",
      "type" : "Beast"
   },
   "Baihu" : {
      "fusion_type" : "normal",
      "level" : "43",
      "type" : "Holy"
   },
   "Baphomet" : {
      "fusion_type" : "normal",
      "level" : "33",
      "type" : "Vile"
   },
   "Barong" : {
      "fusion_type" : "normal",
      "level" : "60",
      "type" : "Avatar"
   },
   "Beelzebub" : {
      "fusion_type" : "normal",
      "level" : "84",
      "type" : "Tyrant"
   },
   "Beelzebub (Fly)" : {
      "fusion_type" : "evolve",
      "level" : "95",
      "type" : "Tyrant"
   },
   "Beji Weng" : {
      "fusion_type" : "normal",
      "level" : "61",
      "type" : "Fury"
   },
   "Berith" : {
      "fusion_type" : "normal",
      "level" : "37",
      "type" : "Fallen"
   },
   "Bicorn" : {
      "fusion_type" : "normal",
      "level" : "15",
      "type" : "Wilder"
   },
   "Bishamon" : {
      "fusion_type" : "normal",
      "level" : "72",
      "type" : "Kishin"
   },
   "Black Frost" : {
      "fusion_type" : "normal",
      "level" : "66",
      "type" : "Night"
   },
   "Black Ooze" : {
      "fusion_type" : "normal",
      "level" : "28",
      "type" : "Foul"
   },
   "Black Rider" : {
      "fusion_type" : "deathstone",
      "level" : "61",
      "type" : "Fiend"
   },
   "Blob" : {
      "fusion_type" : "normal",
      "level" : "16",
      "type" : "Foul"
   },
   "Cai-Zhi" : {
      "fusion_type" : "normal",
      "level" : "26",
      "type" : "Avatar"
   },
   "Cerberus" : {
      "fusion_type" : "normal",
      "level" : "61",
      "type" : "Beast"
   },
   "Chatterskull" : {
      "fusion_type" : "normal",
      "level" : "20",
      "type" : "Haunt"
   },
   "Chimera" : {
      "fusion_type" : "normal",
      "level" : "55",
      "type" : "Holy"
   },
   "Choronzon" : {
      "fusion_type" : "normal",
      "level" : "11",
      "type" : "Haunt"
   },
   "Clotho" : {
      "fusion_type" : "normal",
      "level" : "58",
      "type" : "Femme"
   },
   "Cu Chulainn" : {
      "fusion_type" : "evolve",
      "level" : "52",
      "type" : "Genma"
   },
   "Daisoujou" : {
      "fusion_type" : "deathstone",
      "level" : "37",
      "type" : "Fiend"
   },
   "Dakini" : {
      "fusion_type" : "normal",
      "level" : "52",
      "type" : "Femme"
   },
   "Datsue-Ba" : {
      "fusion_type" : "normal",
      "level" : "7",
      "type" : "Femme"
   },
   "Decarabia" : {
      "fusion_type" : "normal",
      "level" : "58",
      "type" : "Fallen"
   },
   "Dionysus" : {
      "fusion_type" : "normal",
      "level" : "44",
      "type" : "Fury"
   },
   "Dis" : {
      "fusion_type" : "normal",
      "level" : "23",
      "type" : "Yoma"
   },
   "Dominion" : {
      "fusion_type" : "normal",
      "level" : "50",
      "type" : "Divine"
   },
   "Efreet" : {
      "fusion_type" : "evolve",
      "level" : "52",
      "type" : "Yoma"
   },
   "Eligor" : {
      "fusion_type" : "normal",
      "level" : "29",
      "type" : "Fallen"
   },
   "Erthys" : {
      "fusion_type" : "normal",
      "level" : "7",
      "type" : "Element"
   },
   "Feng Huang" : {
      "fusion_type" : "normal",
      "level" : "36",
      "type" : "Holy"
   },
   "Flameis" : {
      "fusion_type" : "normal",
      "level" : "20",
      "type" : "Element"
   },
   "Flauros" : {
      "fusion_type" : "normal",
      "level" : "68",
      "type" : "Fallen"
   },
   "Fomor" : {
      "fusion_type" : "normal",
      "level" : "18",
      "type" : "Night"
   },
   "Forneus" : {
      "fusion_type" : "normal",
      "level" : "20",
      "type" : "Fallen"
   },
   "Futomimi" : {
      "fusion_type" : "normal",
      "level" : "63",
      "type" : "Kishin"
   },
   "Fuu-Ki" : {
      "fusion_type" : "normal",
      "level" : "66",
      "type" : "Brute"
   },
   "Gabriel" : {
      "fusion_type" : "special",
      "level" : "87",
      "type" : "Seraph"
   },
   "Ganesha" : {
      "fusion_type" : "evolve",
      "level" : "58",
      "type" : "Wargod"
   },
   "Garuda" : {
      "fusion_type" : "evolve",
      "level" : "63",
      "type" : "Avian"
   },
   "Girimehkala" : {
      "fusion_type" : "special",
      "level" : "58",
      "type" : "Vile"
   },
   "Gogmagog" : {
      "fusion_type" : "normal",
      "level" : "55",
      "type" : "Jirae"
   },
   "Gui Xian" : {
      "fusion_type" : "evolve",
      "level" : "24",
      "type" : "Dragon"
   },
   "Gurr" : {
      "fusion_type" : "special",
      "level" : "63",
      "type" : "Raptor"
   },
   "Hanuman" : {
      "fusion_type" : "evolve",
      "level" : "46",
      "type" : "Genma"
   },
   "Hell Biker" : {
      "fusion_type" : "deathstone",
      "level" : "42",
      "type" : "Fiend"
   },
   "High Pixie" : {
      "fusion_type" : "evolve",
      "level" : "10",
      "type" : "Fairy"
   },
   "Horus" : {
      "fusion_type" : "normal",
      "level" : "38",
      "type" : "Deity"
   },
   "Hresvelgr" : {
      "fusion_type" : "normal",
      "level" : "75",
      "type" : "Wilder"
   },
   "Hua Po" : {
      "fusion_type" : "normal",
      "level" : "5",
      "type" : "Jirae"
   },
   "Ikusa" : {
      "fusion_type" : "normal",
      "level" : "44",
      "type" : "Brute"
   },
   "Incubus" : {
      "fusion_type" : "normal",
      "level" : "25",
      "type" : "Night"
   },
   "Inugami" : {
      "fusion_type" : "normal",
      "level" : "13",
      "type" : "Beast"
   },
   "Isora" : {
      "fusion_type" : "normal",
      "level" : "14",
      "type" : "Yoma"
   },
   "Jack Frost" : {
      "fusion_type" : "normal",
      "level" : "7",
      "type" : "Fairy"
   },
   "Jinn" : {
      "fusion_type" : "normal",
      "level" : "44",
      "type" : "Yoma"
   },
   "Jiroku" : {
      "fusion_type" : "normal",
      "level" : "52",
      "type" : "Kishin"
   },
   "Kaiwan" : {
      "fusion_type" : "normal",
      "level" : "47",
      "type" : "Night"
   },
   "Kali" : {
      "fusion_type" : "normal",
      "level" : "67",
      "type" : "Lady"
   },
   "Karasu" : {
      "fusion_type" : "evolve",
      "level" : "28",
      "type" : "Yoma"
   },
   "Kelpie" : {
      "fusion_type" : "normal",
      "level" : "26",
      "type" : "Fairy"
   },
   "Kikuri-Hime" : {
      "fusion_type" : "normal",
      "level" : "24",
      "type" : "Lady"
   },
   "Kin-Ki" : {
      "fusion_type" : "normal",
      "level" : "59",
      "type" : "Brute"
   },
   "Kodama" : {
      "fusion_type" : "normal",
      "level" : "3",
      "type" : "Jirae"
   },
   "Koppa" : {
      "fusion_type" : "normal",
      "level" : "19",
      "type" : "Yoma"
   },
   "Koumoko" : {
      "fusion_type" : "normal",
      "level" : "33",
      "type" : "Kishin"
   },
   "Kurama" : {
      "fusion_type" : "evolve",
      "level" : "38",
      "type" : "Genma"
   },
   "Kushinada" : {
      "fusion_type" : "normal",
      "level" : "41",
      "type" : "Lady"
   },
   "Kusi Mitama" : {
      "fusion_type" : "normal",
      "level" : "32",
      "type" : "Mitama"
   },
   "Lachesis" : {
      "fusion_type" : "normal",
      "level" : "63",
      "type" : "Femme"
   },
   "Laksmi" : {
      "fusion_type" : "normal",
      "level" : "54",
      "type" : "Megami"
   },
   "Legion" : {
      "fusion_type" : "normal",
      "level" : "49",
      "type" : "Haunt"
   },
   "Lilim" : {
      "fusion_type" : "normal",
      "level" : "8",
      "type" : "Night"
   },
   "Lilith" : {
      "fusion_type" : "evolve",
      "level" : "80",
      "type" : "Night"
   },
   "Loa" : {
      "fusion_type" : "normal",
      "level" : "53",
      "type" : "Night"
   },
   "Loki" : {
      "fusion_type" : "normal",
      "level" : "52",
      "type" : "Tyrant"
   },
   "Long" : {
      "fusion_type" : "evolve",
      "level" : "44",
      "type" : "Dragon"
   },
   "Mada" : {
      "fusion_type" : "normal",
      "level" : "83",
      "type" : "Vile"
   },
   "Makami" : {
      "fusion_type" : "evolve",
      "level" : "22",
      "type" : "Avatar"
   },
   "Matador" : {
      "fusion_type" : "deathstone",
      "level" : "30",
      "type" : "Fiend"
   },
   "Metatron" : {
      "fusion_type" : "special",
      "level" : "95",
      "type" : "Seraph"
   },
   "Michael" : {
      "fusion_type" : "special",
      "level" : "90",
      "type" : "Seraph"
   },
   "Mikazuchi" : {
      "fusion_type" : "normal",
      "level" : "45",
      "type" : "Kishin"
   },
   "Minakata" : {
      "fusion_type" : "normal",
      "level" : "17",
      "type" : "Kishin"
   },
   "Mithra" : {
      "fusion_type" : "normal",
      "level" : "78",
      "type" : "Deity"
   },
   "Mizuchi" : {
      "fusion_type" : "normal",
      "level" : "34",
      "type" : "Snake"
   },
   "Momunofu" : {
      "fusion_type" : "normal",
      "level" : "20",
      "type" : "Brute"
   },
   "Mot" : {
      "fusion_type" : "normal",
      "level" : "91",
      "type" : "Tyrant"
   },
   "Mothman" : {
      "fusion_type" : "normal",
      "level" : "43",
      "type" : "Wilder"
   },
   "Mou-Ryo" : {
      "fusion_type" : "normal",
      "level" : "7",
      "type" : "Foul"
   },
   "Naga" : {
      "fusion_type" : "normal",
      "level" : "28",
      "type" : "Snake"
   },
   "Nekomata" : {
      "fusion_type" : "normal",
      "level" : "18",
      "type" : "Beast"
   },
   "Nigi Mitama" : {
      "fusion_type" : "normal",
      "level" : "29",
      "type" : "Mitama"
   },
   "Nozuchi" : {
      "fusion_type" : "normal",
      "level" : "14",
      "type" : "Snake"
   },
   "Nue" : {
      "fusion_type" : "normal",
      "level" : "31",
      "type" : "Wilder"
   },
   "Nyx" : {
      "fusion_type" : "normal",
      "level" : "70",
      "type" : "Night"
   },
   "Oberon" : {
      "fusion_type" : "normal",
      "level" : "46",
      "type" : "Fairy"
   },
   "Odin" : {
      "fusion_type" : "normal",
      "level" : "65",
      "type" : "Deity"
   },
   "Okuninushi" : {
      "fusion_type" : "normal",
      "level" : "39",
      "type" : "Kishin"
   },
   "Ongyo-Ki" : {
      "fusion_type" : "special",
      "level" : "81",
      "type" : "Brute"
   },
   "Oni" : {
      "fusion_type" : "normal",
      "level" : "25",
      "type" : "Brute"
   },
   "Onkot" : {
      "fusion_type" : "normal",
      "level" : "37",
      "type" : "Yoma"
   },
   "Orthrus" : {
      "fusion_type" : "normal",
      "level" : "34",
      "type" : "Beast"
   },
   "Ose" : {
      "fusion_type" : "normal",
      "level" : "45",
      "type" : "Fallen"
   },
   "Pale Rider" : {
      "fusion_type" : "deathstone",
      "level" : "63",
      "type" : "Fiend"
   },
   "Parvati" : {
      "fusion_type" : "evolve",
      "level" : "57",
      "type" : "Lady"
   },
   "Pazuzu" : {
      "fusion_type" : "normal",
      "level" : "35",
      "type" : "Vile"
   },
   "Phantom" : {
      "fusion_type" : "normal",
      "level" : "42",
      "type" : "Foul"
   },
   "Pisaca" : {
      "fusion_type" : "normal",
      "level" : "28",
      "type" : "Haunt"
   },
   "Pixie" : {
      "fusion_type" : "normal",
      "level" : "2",
      "type" : "Fairy"
   },
   "Power" : {
      "fusion_type" : "normal",
      "level" : "33",
      "type" : "Divine"
   },
   "Preta" : {
      "fusion_type" : "normal",
      "level" : "4",
      "type" : "Haunt"
   },
   "Principality" : {
      "fusion_type" : "normal",
      "level" : "28",
      "type" : "Divine"
   },
   "Purski" : {
      "fusion_type" : "normal",
      "level" : "48",
      "type" : "Yoma"
   },
   "Pyro Jack" : {
      "fusion_type" : "normal",
      "level" : "19",
      "type" : "Fairy"
   },
   "Queen Mab" : {
      "fusion_type" : "evolve",
      "level" : "56",
      "type" : "Night"
   },
   "Quetzalcoatl" : {
      "fusion_type" : "normal",
      "level" : "55",
      "type" : "Snake"
   },
   "Raiju" : {
      "fusion_type" : "normal",
      "level" : "25",
      "type" : "Wilder"
   },
   "Raja Naga" : {
      "fusion_type" : "evolve",
      "level" : "37",
      "type" : "Snake"
   },
   "Rakshasa" : {
      "fusion_type" : "normal",
      "level" : "63",
      "type" : "Haunt"
   },
   "Rangda" : {
      "fusion_type" : "normal",
      "level" : "72",
      "type" : "Femme"
   },
   "Raphael" : {
      "fusion_type" : "special",
      "level" : "84",
      "type" : "Seraph"
   },
   "Red Rider" : {
      "fusion_type" : "deathstone",
      "level" : "55",
      "type" : "Fiend"
   },
   "Sakahagi" : {
      "fusion_type" : "special",
      "level" : "45",
      "type" : "Foul"
   },
   "Saki Mitama" : {
      "fusion_type" : "normal",
      "level" : "35",
      "type" : "Mitama"
   },
   "Samael" : {
      "fusion_type" : "special",
      "level" : "73",
      "type" : "Vile"
   },
   "Sarasvati" : {
      "fusion_type" : "normal",
      "level" : "30",
      "type" : "Megami"
   },
   "Sarutahiko" : {
      "fusion_type" : "normal",
      "level" : "35",
      "type" : "Jirae"
   },
   "Sati" : {
      "fusion_type" : "normal",
      "level" : "48",
      "type" : "Megami"
   },
   "Scathach" : {
      "fusion_type" : "normal",
      "level" : "64",
      "type" : "Megami"
   },
   "Senri" : {
      "fusion_type" : "evolve",
      "level" : "27",
      "type" : "Holy"
   },
   "Setanta" : {
      "fusion_type" : "normal",
      "level" : "43",
      "type" : "Fairy"
   },
   "Shadow" : {
      "fusion_type" : "normal",
      "level" : "52",
      "type" : "Foul"
   },
   "Shiisaa" : {
      "fusion_type" : "normal",
      "level" : "13",
      "type" : "Holy"
   },
   "Shiki-Ouji" : {
      "fusion_type" : "normal",
      "level" : "54",
      "type" : "Brute"
   },
   "Shikigami" : {
      "fusion_type" : "normal",
      "level" : "4",
      "type" : "Brute"
   },
   "Shikome" : {
      "fusion_type" : "normal",
      "level" : "32",
      "type" : "Femme"
   },
   "Shiva" : {
      "fusion_type" : "special",
      "level" : "95",
      "type" : "Fury"
   },
   "Skadi" : {
      "fusion_type" : "evolve",
      "level" : "74",
      "type" : "Lady"
   },
   "Slime" : {
      "fusion_type" : "normal",
      "level" : "6",
      "type" : "Foul"
   },
   "Sparna" : {
      "fusion_type" : "normal",
      "level" : "54",
      "type" : "Beast"
   },
   "Succubus" : {
      "fusion_type" : "normal",
      "level" : "37",
      "type" : "Night"
   },
   "Sudama" : {
      "fusion_type" : "normal",
      "level" : "13",
      "type" : "Jirae"
   },
   "Sui-Ki" : {
      "fusion_type" : "normal",
      "level" : "62",
      "type" : "Brute"
   },
   "Surt" : {
      "fusion_type" : "normal",
      "level" : "74",
      "type" : "Tyrant"
   },
   "Tao Tie" : {
      "fusion_type" : "normal",
      "level" : "65",
      "type" : "Vile"
   },
   "Taraka" : {
      "fusion_type" : "normal",
      "level" : "20",
      "type" : "Femme"
   },
   "The Harlot" : {
      "fusion_type" : "deathstone",
      "level" : "69",
      "type" : "Fiend"
   },
   "Thor" : {
      "fusion_type" : "normal",
      "level" : "76",
      "type" : "Kishin"
   },
   "Throne" : {
      "fusion_type" : "normal",
      "level" : "64",
      "type" : "Divine"
   },
   "Titan" : {
      "fusion_type" : "normal",
      "level" : "49",
      "type" : "Jirae"
   },
   "Titania" : {
      "fusion_type" : "normal",
      "level" : "57",
      "type" : "Fairy"
   },
   "Troll" : {
      "fusion_type" : "normal",
      "level" : "38",
      "type" : "Fairy"
   },
   "Trumpeter" : {
      "fusion_type" : "deathstone",
      "level" : "77",
      "type" : "Fiend"
   },
   "Unicorn" : {
      "fusion_type" : "normal",
      "level" : "21",
      "type" : "Holy"
   },
   "Uriel" : {
      "fusion_type" : "evolve",
      "level" : "73",
      "type" : "Seraph"
   },
   "Uzume" : {
      "fusion_type" : "normal",
      "level" : "18",
      "type" : "Megami"
   },
   "Valkyrie" : {
      "fusion_type" : "evolve",
      "level" : "33",
      "type" : "Wargod"
   },
   "Virtue" : {
      "fusion_type" : "normal",
      "level" : "41",
      "type" : "Divine"
   },
   "Vishnu" : {
      "fusion_type" : "normal",
      "level" : "93",
      "type" : "Deity"
   },
   "White Rider" : {
      "fusion_type" : "deathstone",
      "level" : "52",
      "type" : "Fiend"
   },
   "Will O' Wisp" : {
      "fusion_type" : "normal",
      "level" : "1",
      "type" : "Foul"
   },
   "Wu Kong" : {
      "fusion_type" : "evolve",
      "level" : "54",
      "type" : "Fury"
   },
   "Yaka" : {
      "fusion_type" : "normal",
      "level" : "17",
      "type" : "Haunt"
   },
   "Yaksini" : {
      "fusion_type" : "normal",
      "level" : "43",
      "type" : "Femme"
   },
   "Yatagarasu" : {
      "fusion_type" : "normal",
      "level" : "46",
      "type" : "Avatar"
   },
   "Yurlungur" : {
      "fusion_type" : "normal",
      "level" : "66",
      "type" : "Snake"
   },
   "Zhen" : {
      "fusion_type" : "normal",
      "level" : "6",
      "type" : "Wilder"
   },
   "Zouchou" : {
      "fusion_type" : "normal",
      "level" : "27",
      "type" : "Kishin"
   }
}
