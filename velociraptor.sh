#!/bin/bash
# written by Daniel Freithofer

RED='\033[0;31m'
NC='\033[0m' # No Color
YELLOW='\033[0;33m'
RANDOMD20=$(( ( RANDOM % 20 )  + 1 ))
RANDOMD4=$(( ( RANDOM % 4 )  + 1 ))
RANDOMD6=$(( ( RANDOM % 6 )  + 1 ))
CRITDAMAGE_CLAW=$((2 * $RANDOMD4))
CRITDAMAGE_BITE=$((2 * $RANDOMD6))

echo 'How many Velociraptors?'
read number_of_raptors
echo ""
# echo 'Enemy AC?'
# read enemy_ac
echo ""
echo -e "${YELLOW}Claw Attacks ${NC} (+4 to hit, 1d4+2 damage, pack tactics)"
echo ""
for (( i=1; i <= $number_of_raptors; ++i ))
do
    RANDOMD20=$(( ( RANDOM % 20 )  + 1 ))
    TO_HIT_1=$(($RANDOMD20 + 4))
    RANDOMD20=$(( ( RANDOM % 20 )  + 1 ))
    TO_HIT_2=$(($RANDOMD20 + 4))
    CRITDAMAGE_CLAW_1=$(( ( RANDOM % 4 )  + 1 ))
    CRITDAMAGE_CLAW_2=$(( ( RANDOM % 4 )  + 1 ))
    CRITDAMAGE_CLAW=$(( (CRITDAMAGE_CLAW_1 + CRITDAMAGE_CLAW_2 +2 ) ))
    if [ $TO_HIT_1 != 24 ] && [ $TO_HIT_2 != 24 ]
        then CRITICAL="false"
        DAMAGE_1=$(($RANDOMD4 + 2))
        echo "$TO_HIT_1,$TO_HIT_2 does $DAMAGE_1 points slashing damage"
    else DAMAGE_1=$CRITDAMAGE_CLAW && echo -e "$TO_HIT_1,$TO_HIT_2 does ${YELLOW}$DAMAGE_1${NC} points slashing damage with a ${YELLOW}critical hit${NC}"
    fi
    RANDOMD4=$(( ( RANDOM % 4 )  + 1 ))
done
echo ""
echo -e "${RED}Bite Attacks${NC} (+4 to hit, 1d6+2 damage, pack tactics)"
echo ""
for (( i=1; i <= $number_of_raptors; ++i ))
do
    RANDOMD20=$(( ( RANDOM % 20 )  + 1 ))
    TO_HIT_1=$(($RANDOMD20 + 4))
    RANDOMD20=$(( ( RANDOM % 20 )  + 1 ))
    TO_HIT_2=$(($RANDOMD20 + 4))
    CRITDAMAGE_BITE_1=$(( ( RANDOM % 6 )  + 1 ))
    CRITDAMAGE_BITE_2=$(( ( RANDOM % 6 )  + 1 ))
    CRITDAMAGE_BITE=$(( (CRITDAMAGE_BITE_1 + CRITDAMAGE_BITE_2 +2 ) ))
    if [ $TO_HIT_1 != 24 ] && [ $TO_HIT_2 != 24 ]
        then CRITICAL="false"
        DAMAGE_2=$(($RANDOMD6 + 2))
        echo "$TO_HIT_1,$TO_HIT_2 does $DAMAGE_2 points piercing damage"
    else DAMAGE_2=$CRITDAMAGE_BITE && echo -e "$TO_HIT_1,$TO_HIT_2 does ${RED}$DAMAGE_2${NC} points piercing damage with a ${RED}critical hit${NC}"
    fi
    # echo "$TO_HIT_1,$TO_HIT_2 does $DAMAGE_2 points piercing damage"
    RANDOMD6=$(( ( RANDOM % 6 )  + 1 ))
done