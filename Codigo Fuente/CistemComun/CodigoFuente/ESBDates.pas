﻿unit ESBDates;

{: ESB Date/Time Routines Collection v 1.8.2<p>
	http://www.tondering.dk/claus/calendar.html<p>
	FREQUENTLY ASKED QUESTIONS ABOUT CALENDARS<p>
	http://www.iso.ch/markete/8601.pdf <p>
}
interface

{.$Define UseESBRoutines} // Uncomment if you have ESB Routines

{$IFDEF VER120}
{$DEFINE D4Plus}
{$ENDIF}
{$IFDEF VER130}
{$DEFINE D4Plus}
{$ENDIF}

{$IFNDEF D4PLUS}
const
	TIME_ZONE_ID_STANDARD = 1;
	TIME_ZONE_ID_DAYLIGHT = 2;
{$ENDIF}

type
{: Different ways in which 2 Digit Years are handled in Str2Date
@enum edyNone - Nothing is done, left to Delphi to handle
@enum edyCutOff - the  ESB2DigitCutOff is used to decide which century
the date lies in. If 1900 + Yr < ESB2DigitCutOff then it is assumed that
2000 + Yr is wanted, otherwise 1900 + Yr is used.
@enum edyHistoric  - asssumes that the yr is this year or earlier}
	TESB2DigitYr = (edyNone, edyCutOff, edyHistoric);

var
{: Different ways in which 2 Digit Years are handled in Str2Date. <p>
edyNone - Nothing is done, left to Delphi to handle <p>
edyCutOff - the  ESB2DigitCutOff is used to decide which century
the date lies in. If 1900 + Yr < ESB2DigitCutOff then it is assumed that
2000 + Yr is wanted, otherwise 1900 + Yr is used.<p>
edyHistoric  - asssumes that the yr is this year or earlier}
	ESB2DigitYr: TESB2DigitYr = edyCutOff;
{: If ESB2DigitYr =	edyCutOff - then  ESB2DigitCutOff is used to decide
which century the date lies in. If 1900 + Yr < ESB2DigitCutOff then
it is assumed that 2000 + Yr is wanted, otherwise 1900 + Yr is used. }
	ESB2DigitCutOff: Word = 1920;

const
{: Time it takes, in days, for the Earth to go from a point in
its rotation and return to that point, i.e. a revolution.
This amount changes (gets smaller) as time progresses.
In 2100 it will be 365.242184 }
	TropicalYear = 365.242190;

{: Time it takes, in days, from one New Moon to the next.
This amount change (gets larger) as time progresses.
in 2100 it will be 29.5305891 }
	SynodicMonth = 29.5305889;

//: English Days of Week - used for DOW2Int
const
	DayOfWeekStrings: array [1..7] of String = ('SUNDAY', 'MONDAY', 'TUESDAY',
		'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY');

//: English Calendar Months - used for Month2Int
const
	MonthStrings: array [1..12] of String = ('JANUARY', 'FEBRUARY', 'MARCH',
		'APRIL','MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER',
		'NOVEMBER', 'DECEMBER');

//--- Year Based Routines ---

{: Is given Year a Leap Year. Thanks to Dr John Stockton
for suggesting a faster methodology }
function IsLeapYear (Year: Word): Boolean;

{: Returns the GoldenNumber for a given Year. Values are 1 -> 19.
The relationship between the Moon's Phases and the Year, repeats
itself every 19 years. }
function GetGoldenNumber (const Year: Word): Integer;

{: Return the Epact, which is a measure of the age of the moon (i.e. the number
of days that have passed since an "official" new moon) on a particular date.
We have uses the Gregorian Calendar calculation }
function GetEpact (const Year: Word): Integer;

{:Returns the Date of Easter Sunday for given Year - based on current Calendar }
function GetEasterSunday (const Year: Word): TDateTime;

{:Returns the Date of Good Friday for given Year - based on current Calendar }
function GetGoodFriday (const Year: Word): TDateTime;

{: Returns First Day of the Year, for a given Year }
function GetFirstDayOfYear (const Year: Word): TDateTime;

{: Returns Last Day of the Year, for a given Year }
function GetLastDayOfYear (const Year: Word): TDateTime;

{: Returns First Sunday of the Year, for a given Year. Used in
Week No Routines }
function GetFirstSundayOfYear (const Year: Word): TDateTime;

//--- Conversions ---

{: Returns Date as a String using ShortDateFormat from Regional
Settings and an Empty String if Date is Zero.
If an error occurs an Empty String is Returned}
function Date2Str (const DT: TDateTime): String;

//: Returns the Day of the Month number from a given date/time
function Date2Day (const DT: TDateTime): Word;

//: Returns the Month number from a given date/time, 1 = Jan, ...
function Date2Month (const DT: TDateTime): Word;

//: Returns the Year from a given date/time
function Date2Year (const DT: TDateTime): Word;

{: Returns the Time Portion as a string HH:MM with time separator
from the Regional Strings
If an error occurs an Empty String is Returned}
function Time2Str (const DT: TDateTime): String;

function Time2PCStart (const DT: TDateTime): String;
function Str2PCTime (S: String): Integer;

//: Returns the Hour from a given date/time
function Time2Hr (const DT: TDateTime): Word;

//: Returns the Minute from a given date/time
function Time2Min (const DT: TDateTime): Word;

//: Returns the Second from a given date/time
function Time2Sec (const DT: TDateTime): Word;

//: Returns the Millisecond from a given date/time
function Time2MSec (const DT: TDateTime): Word;

{: Returns the current Year - from Today's Date}
function ThisYear: Word;

{: Returns the current Month - from Today's Date}
function ThisMonth: Word;

{: Returns the current Day - from Today's Date}
function ThisDay: Word;

{: Returns the current Hour - from the current Time}
function ThisHr: Word;

{: Returns the current Minute - from the current Time}
function ThisMin: Word;

{: Returns the current Second - from the current Time}
function ThisSec: Word;

{: Returns the current Millisecond - from the current Time}
function ThisMSec: Word;

{: Converts a string containing a Time into a DateTime}
function Str2Time (S: String): TDateTime;

{: Converts a string containing a Date into a DateTime. If the Item
has no month and/or year then the current month and year will be assumed <p>
ESB2DigitYr contols the different ways in which 2 Digit Years are handled in
Str2Date. <p>
edyNone - Nothing is done, left to Delphi to handle <p>
edyCutOff - the  ESB2DigitCutOff is used to decide which century
the date lies in. If 1900 + Yr < ESB2DigitCutOff then it is assumed that
2000 + Yr is wanted, otherwise 1900 + Yr is used.<p>
edyHistoric  - asssumes that the yr is this year or earlier}
function Str2Date (S: String): TDateTime;

{: Converts a string containing a Date into a DateTime. If the Item
has no month and/or year then the current month and year will be assumed <p>
If a 2 Digit Year is used then it is assumted that it is this year or earlier}
function Str2HistoricDate (S: String): TDateTime;

{: Converts a string containing a Date into a DateTime. If the Item
has no month and/or year then the current month and year will be assumed <p>
If a 2 Digit Year is used then CutOff is used to decide which century
the date lies in. If 1900 + Yr < CutOff then it is assumed that
2000 + Yr is wanted, otherwise 1900 + Yr is used.}
function Str2CutOffDate (S: string; const CutOff: Word): TDateTime;

{: Given a Description of a Day of Week, this returns the Integer Code,
with 1 = Sunday through 7 = Saturday like the Borland DayOfWeek. This
is Case Insensitive and does a left match with the DayOfWeekStrings,
so F would be interpreted as Friday, Su and S would both give Sunday,
whereas Sa would return Saturday. Returns 0 if unable to convert to a
Day of the Week }
function DOW2Int (const DOW: string): Integer;

{: Given a Description of a Month, this returns the Integer Code,
with 1 = January through 12 = December. This is Case Insensitive and
does a left match with the MonthStrings, so D would be interpreted as December,
Ja and J would both give January, whereas Jul would return July. Returns 0 if
unable to convert to a Month }
function Month2Int (const Month: string): Integer;

//--- Date/Time Arithmetic ---
function PCMinutesApart (const DT1, DT2: TDateTime): Integer;

{: Converts a time in MilliSeconds to a string of the form H:MM:SS.mmm }
function MS2TimeStr (const MS: LongInt): String;

{: Converts a time in Minutes to a string of the form H:MM}
function Min2TimeStr (const MS: Integer): String;


{: Returns the current date/time as a string in the Format of: YYYYMMDD-HHMMSSmmm}
function GetDateTimeStamp: String;

{: Adjusts the date so that it has the Year specified. }
function AdjustDateYear (const D: TDateTime; const Year: Word): TDateTime;

{: Adds a Floating Point amount of Seconds to a Given Date/Time }
function AddSecs (const DT: TDateTime; const Secs: Extended): TDateTime;

{: Adds a Floating Point amount of Minutes to a Given Date/Time }
function AddMins (const DT: TDateTime; const Mins: Integer): TDateTime;

{: Adds a Floating Point amount of Hours to a Given Date/Time }
function AddHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;

{: Adds a Floating Point amount of Days to a Given Date/Time
	Time portion preserved. Though this is the same as
	normal Addition it is added for completion }
function AddDays (const DT: TDateTime; const Days: Extended): TDateTime;

{: Adds a Floating Point amount of Weeks to a Given Date/Time
	Time portion preserved. }
function AddWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;

{: Adds a Floating Point amount of Fortnights to a Given Date/Time
	Time portion preserved. }
function AddFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;

{: Adds a Floating Point amount of Months to a Given Date/Time
Fractional portion of Month is assumed to be related to 30 day months.
Time portion preserved. <p>

If adding Months results in landing on a nonsense date like 31 Apr
then the last day in the month is used. This only applies to the
integral component of the Months Added. The fractional part always
is added to the resultant Date/Time }
function AddMonths (const DT: TDateTime; const Months: Extended): TDateTime;

{: Adds a Floating Point amount of Quarters to a Given Date/Time
Fractional portion of Quarter is assumed to be related to 30 day month,
as the AddMonths routine is used.
Time portion preserved. <p>

If adding Quarters results in landing on a nonsense date like 31 Apr
then the last day in the month is used. This only applies to the
integral component of the Quarter Added. The fractional part always
is added to the resultant Date/Time }
function AddQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;

{: Adds a Floating Point amount of Semesters to a Given Date/Time
Fractional portion of Semester is assumed to be related to 30 day month,
as the AddMonths routine is used.
Time portion preserved. <p>

If adding Semesters results in landing on a nonsense date like 31 Apr
then the last day in the month is used. This only applies to the
integral component of the Semeters Added. The fractional part always
is added to the resultant Date/Time }
function AddSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;

{: Adds a Floating Point amount of Years to a Given Date/Time
Fractional portion of Year is assumed to be related to 365.25 day years.
Time portion preserved.<p>

If Adding Years results in landing on Feb 29 in a non-leap year, then
this will be converted to Feb 28.This only applies to the
integral component of the Years Added. The fractional part always
is added to the resultant Date/Time }
function AddYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Seconds from a Given Date/Time }
function SubtractSecs (const DT: TDateTime; const Secs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Minutes from a Given Date/Time }
function SubtractMins (const DT: TDateTime; const Mins: Integer): TDateTime;

{: Subtracts a Floating Point amount of Hours from a Given Date/Time }
function SubtractHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Days from a Given Date/Time
Time portion preserved. }
function SubtractDays (const DT: TDateTime; const Days: Extended): TDateTime;

{: Subtracts a Floating Point amount of Weeks from a Given Date/Time
Time portion preserved. }
function SubtractWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;

{: Subtracts a Floating Point amount of Fortnights from a Given Date/Time
Time portion preserved. }
function SubtractFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;

{: Subtracts a Floating Point amount of Months from a Given Date/Time
Fractional portion of Month is assumed to be related to 30 day months.
Time portion preserved. <p>

If Subtracting Months results in landing on a nonsense date like 31 Apr
then the last day in the month is used. This only applies to the
integral component of the Months Subtracted. The fractional part always
is Subtracted from the resultant Date/Time }
function SubtractMonths (const DT: TDateTime; const Months: Extended): TDateTime;

{: Subtracts a Floating Point amount of Quarters from a Given Date/Time
Fractional portion of Quarter is assumed to be related to 30 day month,
as the AddMonths routine is used.
Time portion preserved. <p>

If Subtracting Quarters results in landing on a nonsense date like 31 Apr
then the last day in the month is used. This only applies to the
integral component of the Quarter Subtracted. The fractional part always
is Subtracted from the resultant Date/Time }
function SubtractQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;

{: Subtracts a Floating Point amount of Semesters from a Given Date/Time
Fractional portion of Semester is assumed to be related to 30 day month,
as the AddMonths routine is used.
Time portion preserved. <p>

If Subtracting Semesters results in landing on a nonsense date like 31 Apr
then the last day in the month is used. This only applies to the
integral component of the Semeters Subtracted. The fractional part always
is Subtracted from the resultant Date/Time }
function SubtractSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;

{: Subtracts a Floating Point amount of Years from a Given Date/Time
Fractional portion of Year is assumed to be related to 365.25 day years.
Time portion preserved.<p>

If Subtracting Years results in landing on Feb 29 in a non-leap year, then
this will be converted to Feb 28.This only applies to the
integral component of the Years Subtracted. The fractional part always
is Subtracted from the resultant Date/Time }
function SubtractYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;

{: Returns Last Day of the Month, for a given Date/Time - Time portion preserved }
function GetLastDayOfMonth (const DT: TDateTime): TDateTime;

{: Returns First Day of the Month, for a given Date/Time - Time portion preserved }
function GetFirstDayOfMonth (const DT: TDateTime): TDateTime;

{: Returns the Start of the week containing given Date/Time, assumes that
the Start of the Week is Sunday - Time portion preserved }
function StartOfWeek (const DT: TDateTime): TDateTime;

{: Returns the End of the week containing given Date/Time, assumes that
the End of the Week is Saturday - Time portion preserved }
function EndOfWeek (const DT: TDateTime): TDateTime;

{: Converts a given number of Seconds (Floating) into a string
specifying the number of days, hours, minutes, seconds.
Routine donated by: Marcos Guzm�n Monta�ez marcos.guzman@eds.com
}
function Hrs_Min_Sec (Secs: Extended): string;

//: Returns true if both DateTimes refer to the same Calendar Month, can have different years
function DatesInSameMonth (const DT1, DT2: TDateTime): Boolean;

//: Returns true if both DateTimes refer to the same Year
function DatesInSameYear (const DT1, DT2: TDateTime): Boolean;

//: Returns true if both DateTimes refer to the exact same Month, cannot have different years
function DatesInSameMonthYear (const DT1, DT2: TDateTime): Boolean;

{: Returns the Number of Days between DT2 and DT1. If result is 0 then
they are the same Date, if result is negative then DT2 occurs before
DT1 }
function DaysApart (const DT1, DT2: TDateTime): LongInt;

{: Returns the Exact Number of Weeks between DT2 and DT1. If result is 0 then
they are in the same Day, if result is negative then DT2 occurs before
DT1 }
function ExactWeeksApart (const DT1, DT2: TDateTime): Extended;

{: Returns the Number of Weeks between DT2 and DT1. If result is 0 then
they are in within a Week of each other, if result is negative then DT2
occurs before DT1 }
function WeeksApart (const DT1, DT2: TDateTime): LongInt;

//: Returns True if the Date falls in a leap year
function DateIsLeapYear (const DT: TDateTime): Boolean;

//: Returns the number of days in the Month represented by the given Date
function DaysInMonth (const DT: TDateTime): Byte;

//: Returns the number of days in the current Month
function DaysInThisMonth: Byte;

//: Returns the Number of days left in the Month represented by the given Date
function DaysLeftInMonth (const DT: TDateTime): Byte;

//: Returns the number of days left in the current Month
function DaysLeftInThisMonth: Byte;

//: Returns the number of days in the Year represented by the given Date
function DaysInYear (const DT: TDateTime): Word;

//: Returns the Day Number in the Year represented by the given Date
function DayOfYear (const DT: TDateTime): Word;

//: Returns the Day Number in this Year represented by today
function ThisDayOfYear: Word;

//: Returns the number of days left in the Year represented by the given Date
function DaysLeftInYear (const DT: TDateTime): Word;

//: Returns the number of days left in this Year
function DaysLeftInThisYear: Word;

//: Returns 1 if Date in Jan through Jun or 2 if Date in Jul through Dec
function WhichSemester (const DT: TDateTime): Byte;

{: Returns 1 if Date in Jan through Mar, 2 if Date in Apr through Jun,
3 if Date in Jul through Sep, 4 if Date in Oct through Dec}
function WhichQuarter (const DT: TDateTime): Byte;

{: Returns First Day of the Quarter, for a given Date/Time - Time portion preserved }
function GetFirstDayOfQuarter (const DT: TDateTime): TDateTime;

{: Returns Last Day of the Quarter, for a given Date/Time - Time portion preserved }
function GetLastDayOfQuarter (const DT: TDateTime): TDateTime;

{: Returns First Day of the Quarter, for a given Quarter and Year }
function GetFirstDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;

{: Returns Last Day of the Quarter, for a given Quarter and Year }
function GetLastDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;

{: Returns the Age (in years) of a "person" given their Date of Birth (DOB)
and the Date of Reference (DT). If DT occurs before DB then -1 is returned }
function AgeAtDate (const DOB, DT: TDateTime): Integer;

{: Returns the current Age (in years) of a "person" given their Date of Birth (DOB)
using the System Date. If DOB occurs after the System Date then -1 is returned }
function AgeNow (const DOB: TDateTime): Integer;

{: Returns the Age (in months) of a "person" given their Date of Birth (DOB)
and the Date of Reference (DT). If DT occurs before DB then -1 is returned.
Routine donated by David Gobbett}
function AgeAtDateInMonths (const DOB, DT: TDateTime): Integer;

{: Returns the current Age (in months) of a "person" given their Date of Birth (DOB)
using the System Date. If DOB occurs after the System Date then -1 is returned
Routine donated by David Gobbett}
function AgeNowInMonths (const DOB: TDateTime): Integer;

{: Returns the Age (in weeks) of a "person" given their Date of Birth (DOB)
and the Date of Reference (DT). If DT occurs before DB then -1 is returned.
Routine donated by David Gobbett}
function AgeAtDateInWeeks (const DOB, DT: TDateTime): Integer;

{: Returns the current Age (in weeks) of a "person" given their Date of Birth (DOB)
using the System Date. If DOB occurs after the System Date then -1 is returned
Routine donated by David Gobbett}
function AgeNowInWeeks (const DOB: TDateTime): Integer;

{: Returns the current Age as a Description useful for Hospital Applications.
Returns Age in weeks if < 2 Months Old, in Months if less than 1 year old
otherwise in years }
function AgeNowDescr (const DOB: TDateTime): String;

//--- Week No Routines ---

{: Converts Dates into a Week No in the Current Year. Weeks are assumed to
start with Sunday. The week that Jan 1 occurs is the 1st week of the year,
the Sunday AFTER Jan 1 would be the start of the 2nd week of the year. Note
that this does mean that there can be 53 weeks in a year! }
function Date2WeekNo (const DT: TDateTime): Integer;

{Returns true if the two Dates are in the same WeekNo. Will return false
if Dates from Different Years }
function DatesInSameWeekNo (const DT1, DT2: TDateTime): Boolean;

{Returns true No of Weeks, based on WeekNo, that the two dates are
apart. A Negative result implies DT2 occurs before D1. Will return -999
if Dates from Different Years }
function WeekNosApart (const DT1, DT2: TDateTime): Integer;

//: Returns the WeekNo of the current Date (System Date)
function ThisWeekNo: Integer;

{: Returns the Start of the Week for the given WeekNo in the given year,
assuming that the Start of the Week is Sunday }
function StartOfWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the End of the Week for the given WeekNo in the given year,
assuming that the End of the Week is Saturday }
function EndOfWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the Date for a given Day of Week, a given WeekNo, and the given Year,
assuming that the Start of the Week is Sunday, and that DOW uses 1 for Sunday }
function DWY2Date (const DOW, WeekNo, Year: Word): TDateTime;

// --- ISO-8601 Compliant Routines ---

{: Returns Day Of Week According to ISO-8601 which has Monday as 1 and
	Sunday as 7 }
function ISODayOfWeek (const DT: TDateTime): Integer;

{: Most years have 52 weeks, but years that start on a Thursday and leap
years that start on a Wednesday (or Thursday) have 53 weeks. Based on
code supplied by Niklas Astram }
function ISOWeeksInYear (const Year: Word): Byte;

{: Returns First Monday of the Year, for a given Year. Used in
ISO-8601 Week No Routines }
function GetFirstMondayOfYear (const Year: Word): TDateTime;

{: Returns the Start of the week containing given Date/Time, assumes that
the Start of the Week is Monday according to ISO-8601
- Time portion preserved }
function StartOfISOWeek (const DT: TDateTime): TDateTime;

{: Returns the End of the week containing given Date/Time, assumes that
the End of the Week is Sunday according to ISO-8601
- Time portion preserved }
function EndOfISOWeek (const DT: TDateTime): TDateTime;

{: Converts Dates into a Week No and Year according to ISO-8601. Weeks are
assumed to start with Monday. The week that Jan 4 occurs in is the 1st week of
the year. Note that this does mean that there can be 53 weeks in a year!  }
procedure Date2ISOWeekNo (const DT: TDateTime; var WeekNo: Byte;
	var Year: Word);

{: Returns Date as a Basic Format for ISO Calendar Week/Day: YYYYWwwD where
YYYY is year, 'W' is literal, ww is weekno and D is the ISO Day of Week - Monday
is First Day }
function Date2ISOWeekStr (const DT: TDateTime): string;

{: Returns Date as a Enhanced Format for ISO Calendar Week/Day: YYYY-Www-D where
YYYY is year, 'W' is literal, ww is weekno and D is the ISO Day of Week - Monday
is First Day }
function Date2ISOWeekEnhStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Calendar Week: YYYYWww where
YYYY is year, 'W' is literal, ww is weekno }
function Date2ISOWeekOnlyStr (const DT: TDateTime): string;

{: Returns Date as a Enhanced Format for ISO Calendar Week: YYYY-Www where
YYYY is year, 'W' is literal, ww is weekno }
function Date2ISOWeekOnlyEnhStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Dates: YYYYMMDD where
YYYY is year, MM is the Month, DD is Day of Month. Zero Padded }
function Date2ISOStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Dates: YYYY-MM-DD where
YYYY is year, MM is the Month, DD is Day of Month. Zero Padded }
function Date2ISOEnhStr (const DT: TDateTime): string;

{: Returns Date as a Basic Format for ISO Dates: YYYYMMDD where
YYYY is year, MM is the Month, DD is Day of Month. Zero Padded. }
function Date2ISOInt (const DT: TDateTime): Cardinal;

{Returns true if the two Dates are in the same ISO-8601 WeekNo }
function DatesInSameISOWeekNo (const DT1, DT2: TDateTime): Boolean;

{Returns true No of Weeks, based on ISOWeekNo, that the two dates are
apart. A Negative result implies DT2 occurs before D1. }
function ISOWeekNosApart (DT1, DT2: TDateTime): Integer;

//: Returns the ISO-8601 WeekNo of the current Date (System Date)
procedure ThisISOWeekNo (var WeekNo: Byte; var Year: Word);

{: Returns the Start of the Week for the given ISO-8601 WeekNo in the given
year. Note that the Start of the Week is Monday in ISO-8601 }
function StartOfISOWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the End of the Week for the given ISO-8601 WeekNo in the given
year. Note that the End of the Week is Sunday in ISO-8601 }
function EndOfISOWeekNo (const WeekNo, Year: Word): TDateTime;

{: Returns the Date for a given Day of Week, a given WeekNo, and the given Year,
as defined in ISO-8601. Note that the Start of the Week is Monday, and
that DOW uses 1 for Monday }
function ISOYWD2Date (const Year: Word; const WeekNo, DOW: Byte): TDateTime;

//--- Boolean Identification ---

//: Returns True if the given Date's Month is January
function IsJanuary (const DT: TDateTime): Boolean;

//: Returns True if today's Month is January
function IsJanuaryNow: Boolean;

//: Returns True if the given Date's Month is February
function IsFebruary (const DT: TDateTime): Boolean;

//: Returns True if today's Month is February
function IsFebruaryNow: Boolean;

//: Returns True if the given Date's Month is March
function IsMarch (const DT: TDateTime): Boolean;

//: Returns True if today's Month is March
function IsMarchNow: Boolean;

//: Returns True if the given Date's Month is April
function IsApril (const DT: TDateTime): Boolean;

//: Returns True if today's Month is April
function IsAprilNow: Boolean;

//: Returns True if the given Date's Month is May
function IsMay (const DT: TDateTime): Boolean;

//: Returns True if today's Month is May
function IsMayNow: Boolean;

//: Returns True if the given Date's Month is June
function IsJune (const DT: TDateTime): Boolean;

//: Returns True if today's Month is June
function IsJuneNow: Boolean;

//: Returns True if the given Date's Month is July
function IsJuly (const DT: TDateTime): Boolean;

//: Returns True if today's Month is July
function IsJulyNow: Boolean;

//: Returns True if the given Date's Month is August
function IsAugust (const DT: TDateTime): Boolean;

//: Returns True if today's Month is August
function IsAugustNow: Boolean;

//: Returns True if the given Date's Month is September
function IsSeptember (const DT: TDateTime): Boolean;

//: Returns True if today's Month is September
function IsSeptemberNow: Boolean;

//: Returns True if the given Date's Month is October
function IsOctober (const DT: TDateTime): Boolean;

//: Returns True if today's Month is October
function IsOctoberNow: Boolean;

//: Returns True if the given Date's Month is November
function IsNovember (const DT: TDateTime): Boolean;

//: Returns True if today's Month is November
function IsNovemberNow: Boolean;

//: Returns True if the given Date's Month is December
function IsDecember (const DT: TDateTime): Boolean;

//: Returns True if todays Month is December
function IsDecemberNow: Boolean;

//: Returns True if the Time portion is a AM value
function IsAM (const DT: TDateTime): Boolean;

//: Returns True if the currnet Time is a AM value
function IsAMNow: Boolean;

//: Returns True if the Time portion is a PM value
function IsPM (const DT: TDateTime): Boolean;

//: Returns True if the current Time is a PM value
function IsPMNow: Boolean;

//: Returns True if the Time portion represents Noon, 12:00pm
function IsNoon (const DT: TDateTime): Boolean;

//: Returns True if the current Time represents Noon, 12:00pm
function IsNoonNow: Boolean;

//: Returns True if the Time portion represents Midnight, 12:00am
function IsMidnight (const DT: TDateTime): Boolean;

//: Returns True if the current Time represents Midnight, 12:00am
function IsMidnightNow: Boolean;

//: Returns True if the Date represents a Sunday
function IsSunday (const DT: TDateTime): Boolean;

//: Returns True if today is a Sunday
function IsSundayNow: Boolean;

//: Returns True if the Date represents a Monday
function IsMonday (const DT: TDateTime): Boolean;

//: Returns True if today is a Monday
function IsMondayNow: Boolean;

//: Returns True if the Date represents a Tuesday
function IsTuesday (const DT: TDateTime): Boolean;

//: Returns True if today is a Tuesday
function IsTuesdayNow: Boolean;

//: Returns True if the Date represents a Wednesday
function IsWednesday (const DT: TDateTime): Boolean;

//: Returns True if today is a Wednesday
function IsWednesdayNow: Boolean;

//: Returns True if the Date represents a Thursday
function IsThursday (const DT: TDateTime): Boolean;

//: Returns True if today is a Thursday
function IsThursdayNow: Boolean;

//: Returns True if the Date represents a Friday
function IsFriday (const DT: TDateTime): Boolean;

//: Returns True if today is a Friday
function IsFridayNow: Boolean;

//: Returns True if the Date represents a Saturday
function IsSaturday (const DT: TDateTime): Boolean;

//: Returns True if today is a Saturday
function IsSaturdayNow: Boolean;

//: Returns True if the Date represents Saturday or Sunday
function IsWeekend (const DT: TDateTime): Boolean;

//: Returns True if today is Saturday or Sunday
function IsWeekendNow: Boolean;

//: Returns True if the Date represents Monday through Friday
function IsWeekday (const DT: TDateTime): Boolean;

//: Returns True if today is Monday through Friday
function IsWeekdayNow: Boolean;

{!~ Returns True if DateString is a valid date,False otherwise.}
Function IsDate(DateString: String): Boolean;
Function IsTime(TimeString: String): Boolean;

//--- TimeZone Routines ---

{: Returns the Local TimeZone Bias, in Minutes, taking into account Standard
	and/or Daylight Biases, from the Regional Settings }
function GetLocalTZBias: LongInt;

{: Sets the Local TimeZone Bias, in Minutes, taking into account current Standard
and/or Daylight Biases, from the Regional Settings. <p>

<B>BE CAREFUL</B> when changing Regional Setting. Best to call GetLocalTZBias
first so you can reset the value. This causes changes to your System's
Regional Settings.<p>

<B>WARNING.</B> You can seriously mess up your compute with this routine!<p>

If messed up go to Control Panel Date/Time Applet, choose another Time
Zone, Apply it, change back to your Time Zone, Apply it,
fix the date/time, and apply it.		 }
procedure SetLocalTZBias (const Bias: Longint);

{: Returns the TimeZone Name from the Regional Settings}
function GetTimeZoneName: string;

{: Returns the Difference from GMT (Greenwich Mean Time) as a string. For
example mine is "GMT+8" }
function GetGMTDifference: string;

{: Returns the GMT string as a value. For example mine is "GMT+8" would return 8.0.
Must contain a '+' or '-' sign, the 'GMT' is actually ignored currently,
though this may change in the future }
function GMTStr2Value(const GMTStr: string): Extended;

{: Uses Regional Strings to determine your TimeZone and returns the
Date/Time given (taken as being in your Time Zone) as GMT (Greenwich
Mean Time) based }
function GetGMTTime (const DT: TDateTime): TDateTime;

{: Uses Regional Strings to determine your TimeZone and returns the
Date/Time given (taken as being in GMT) as Local Time based }
function GetLocalTime (const DT: TDateTime): TDateTime;

{: Converts a Given Date/Time based on FromGMTStr (e.g. GMT+4) and returns
a Date/Time using the ToGMTStr (e.g. GMT-5) }
function ConvertGMTStrTimes (const FromGMTStr: string; const FromDT: TDateTime;
	const ToGMTStr: string): TDateTime;

{: Returns the Difference from UT (Universal TimeGreenwich Mean Time) as a string,
following the RFC822 Standard. For example mine is "+0800" }
function GetRFC822Difference: string;

{: Returns the RFC822 string as a value. For example mine is "+0800" would return 8.0.
Must be a valid RFC822 string else 0 is returned.
Includes Support for GMT / UT / EST / EDT / CST / CDT / MST / MDT
/ PST / PDT and Military Z / A / M / N / Y }
function RFC822Value(const RFC822: string): Extended;

{: Converts a Given Date/Time based on FromRFC822 (e.g. +0400) and returns
a Date/Time using the ToRFC822 (e.g. EST).
Includes Support for GMT / UT / EST / EDT / CST / CDT / MST / MDT
/ PST / PDT and Military Z / A / M / N / Y }
function ConvertRFC822Times (const FromRFC822: string; const FromDT: TDateTime;
	const ToRFC822: string): TDateTime;

implementation

uses
	{$IFDEF UseESBRoutines}
	ESBRtns,
	{$ENDIF}
	Windows, SysUtils,Dialogs,DateUtils;

{$IFNDEF UseESBRoutines}
// --- Routines taken from ESBRoutines ---

function LInt2EStr (const L: LongInt): String;
begin
	try
		Result := IntToStr (L);
	except
		Result := '';
	end;
end;

function LeftStr (const S : string; const N : Integer): string;
begin
	Result := Copy (S, 1, N);
end;

function RightAfterStr (const S : String; const N : Integer): String;
begin
	Result := Copy (S, N + 1, Length (S) - N );
end;

function FillStr (const Ch : Char; const N : Integer): string;
begin
	SetLength (Result, N);
	FillChar (Result [1], N, Ch);
end;

function PadChLeftStr (const S : string; const Ch : Char;
	const Len : Integer): string;
var
	N: Integer;
begin
	N := Length (S);
	if N < Len then
		Result := FillStr (Ch, Len - N) + S
	else
		Result := S;
end;

function LInt2ZStr (const L: LongInt; const Len: Byte): String;
begin
	Result := LInt2EStr (L);
	Result := PadChLeftStr (LeftStr (Result, Len), '0', Len);
end;

function ReplaceChStr (const S : string;
	const OldCh, NewCh : Char): string;
var
	I: Integer;
begin
	Result := S;
	if OldCh = NewCh then
		Exit;
	for I := 1 to Length (S) do
		if S [I] = OldCh then
			Result [I] := NewCh;
end;

function Str2Ext (const S: String): Extended;
begin
	try
		Result := StrToFloat (S);
	except
		Result := 0;
	end;
end;

function Str2Lint (const S: String): LongInt;
begin
	try
		Result := StrToInt (S);
	except
		Result := 0;
	end;
end;
// --- End Routines taken from ESBRoutines ---
{$ENDIF}

function IsLeapYear (Year: Word): Boolean;
begin
	Result := ((Year and 3) = 0) and ((Year mod 100 > 0) or (Year mod 400 = 0))
end;

function Date2Str (const DT: TDateTime): String;
begin
	try
		if abs (DT) < 0.000001 then
			Result := ''
		else
			Result := DateToStr (DT);
	except
		Result := '';
	end;
end;


function Time2PCStart (const DT: TDateTime): String;
var
	Hrs, Mins, Secs, MSecs: Word;
begin
//if N < Len then
//		Result := FillStr (Ch, Len - N) + S
//	else
//		Result := S;
   if IsAm(DT) then
	try
		DecodeTime (DT, Hrs, Mins, Secs, MSecs);
                if (Hrs =0) then Hrs := Hrs + 12;
		Result := LInt2EStr (Hrs) + TimeSeparator
			+ LInt2ZStr (Mins, 2) + ' AM';
	except
		Result := '';
	end
   else
   	try
		DecodeTime (DT, Hrs, Mins, Secs, MSecs);
                if (Hrs >=13) then Hrs := Hrs - 12;
		Result := LInt2EStr (Hrs ) + TimeSeparator
			+ LInt2ZStr (Mins, 2)+ ' PM';
	except
		Result := '';
	end;
   {	try      //orig line
		DecodeTime (DT, Hrs, Mins, Secs, MSecs);
		Result := LInt2EStr (Hrs) + TimeSeparator
			+ LInt2ZStr (Mins, 2);
	except
		Result := '';
	end; }
end;

function Str2PCTime (S: String): Integer;
var
	Hrs, Mins, Secs, MSecs: Word;
        d: TdateTime;
begin
   //Result := Time2Hr (Time); //thishr
   //	DecodeTime (DT, Result, Min, Sec, MSec); //time2hr TDatetime
   //function Str2Time (S: String): TDateTime;
   d := Str2Time(s);
   DecodeTime (d, Hrs, Mins, Secs, MSecs);
   Result := Hrs + Mins div 60 ;
end;





function Date2Year (const DT: TDateTime): Word;
var
	D, M: Word;
begin
	DecodeDate (DT, Result, M, D);
end;

function Date2Month (const DT: TDateTime): Word;
var
	D, Y : Word;
begin
	DecodeDate (DT, Y, Result, D);
end;

function Date2Day (const DT: TDateTime): Word;
var
	M, Y : Word;
begin
	DecodeDate (DT, Y, M, Result);
end;

function Time2Hr (const DT: TDateTime): Word;
var
	Min, Sec, MSec: Word;
begin
	DecodeTime (DT, Result, Min, Sec, MSec);
end;

function Time2Min (const DT: TDateTime): Word;
var
	Hr, Sec, MSec: Word;
begin
	DecodeTime (DT, Hr, Result, Sec, MSec);
end;

function Time2Sec (const DT: TDateTime): Word;
var
	Hr, Min, MSec: Word;
begin
	DecodeTime (DT, Hr, Min, Result, MSec);
end;

function Time2MSec (const DT: TDateTime): Word;
var
	Hr, Min, Sec: Word;
begin
	DecodeTime (DT, Hr, Min, Sec, Result);
end;

function MS2TimeStr (const MS: LongInt): String;
var
	L: LongInt;
begin
	L := MS;
	Result := '.' + LInt2ZStr (L mod 1000, 3);
	L := L div 1000;
	Result := ':' + LInt2ZStr (L mod 60, 2) + Result;
	L := L div 60;
	Result := ':' + LInt2ZStr (L mod 60, 2) + Result;
	L := L div 60;
	Result := LInt2EStr (L) + Result ;
end;

function Min2TimeStr (const MS: Integer): String;
var
	L: Integer;
begin
        // showmessage(inttostr(MS));
	//Result := LInt2EStr (L);
	//Result := PadChLeftStr (LeftStr (Result, Len), '0', Len);
	L := MS;
        if L < 0 then
        begin
          Result := LInt2EStr (L mod 60);
        end;
        if L = 0  then
        begin
          Result := '0:00';
        end;
        if L > 0  then
        begin
          Result := ':' + LInt2ZStr (L mod 60, 2);
          L := L div 60;
	  Result := LInt2EStr (L) + Result ;
        end;
end;


function AdjustDateYear (const D: TDateTime; const Year: Word): TDateTime;
var
	Day, Month, OldYear: Word;
begin
	DecodeDate (D, OldYear, Month, Day);
	if Year = OldYear then
	begin
		Result := Int (D);
		Exit;
	end;
	if not IsLeapYear (Year) and (Month = 2) and (Day = 29) then
	begin
		Month := 3;
		Day := 1;
	end;
	Result := EncodeDate (Year, Month, Day);
end;

function GetDateTimeStamp: String;
var
	DT: TDateTime;
	Year, Month, Day: Word;
	Hr, Min, Sec, MSec: Word;
begin
	DT := Now;
	DecodeDate (DT, Year, Month, Day);
	DecodeTime (DT, Hr, Min, Sec, MSec);
	Result := LInt2ZStr (Year, 4) + LInt2ZStr (Month, 2) +
		LInt2ZStr (Day, 2) + '-' + LInt2ZStr (Hr, 2) +
		LInt2ZStr (Min, 2) + LInt2ZStr (Sec, 2) + Lint2ZStr (MSec, 3);
end;

function Time2Str (const DT: TDateTime): String;
var
	Hrs, Mins, Secs, MSecs: Word;
begin
	try
		DecodeTime (DT, Hrs, Mins, Secs, MSecs);
                //if Hrs=0 then Result := LInt2ZStr (Mins, 2);
                 if Hrs<=0 then
                 begin
                   if Mins >= 0 then Result := '0:' + LInt2ZStr (Mins, 2);
                   if Mins < 0 then Result := LInt2ZStr (Mins, 2);
                 end;
                 //if Hrs<>0 then Result := LInt2EStr (Hrs) + TimeSeparator	+ LInt2ZStr (Mins, 2);
                 if Hrs>0 then  Result := LInt2EStr (Hrs) + TimeSeparator	+ LInt2ZStr (Mins, 2);

	except
		Result := '';
	end;
end;


function Str2Time(S: String): TDateTime;
begin
        if S = '' then
	begin
		Result := 0.0;
		Exit;
	end;

	try
		// Allow '.' and ':' as valid alternatives for TimeSeparator
		S := ReplaceChStr ( S, '.', TimeSeparator);
		S := ReplaceChStr ( S, ':', TimeSeparator);

		// Remove trailing Separator if any
		if S [Length (S)] = TimeSeparator then
		begin
			S := LeftStr (S, Length (S) - 1);
			if S = '' then
			begin
				Result := 0.0;
				Exit;
			end;
		end;

		//Frac ensures the Date Component is 0
	       	//Result := Frac (StrToTime (S));
                //showmessage(s);
                Result := Frac(StrToTime (S));
                //showmessage(timetostr(result));
	except
		Result := 0.0;
	end;
end;

{ Routines from SysUtils though Routines are in the implementation only }

type
	TDateOrder = (doMDY, doDMY, doYMD);

function GetDateOrder (const DateFormat: string): TDateOrder;
var
	I: Integer;
begin
	Result := doMDY;
	I := 1;
	while I <= Length(DateFormat) do
	begin
		case char (Ord (DateFormat[I]) and $DF) of
			'E': Result := doYMD;
			'Y': Result := doYMD;
			'M': Result := doMDY;
			'D': Result := doDMY;
		else
			Inc(I);
			Continue;
		end;
		Exit;
	end;
	Result := doMDY;
end;

{---}

function Str2Date (S: String): TDateTime;
var
	P1, P2: Integer;
	Yr: Word;
	DateOrder: TDateOrder;
begin
	if S = '' then
	begin
		Result := 0.0;
		Exit;
	end;

	try
		// Allow '-' and '/' as valid alternatives for DateSeparator
		S := ReplaceChStr ( S, '-', DateSeparator);
		S := ReplaceChStr ( S, '/', DateSeparator);

		// Remove trailing Separator if any
		if S [Length (S)] = DateSeparator then
		begin
			S := LeftStr (S, Length (S) - 1);
			if S = '' then
			begin
				Result := 0.0;
				Exit;
			end;
		end;

		DateOrder := GetDateOrder(ShortDateFormat);
		P1 := Pos (DateSeparator, S);
		if P1 > 0 then // If at least one Date Separator
		begin
			P2 := Pos (DateSeparator, Copy (S, P1 + 1, Length (S) - P1));
			if P2 > 0 then // If 2 Date Separators
			begin
				// Get Components
				case DateOrder of
					doMDY, doDMY:
					begin
						Yr := Str2LInt (Copy (S, P1 + P2 + 1, Length (S) - (P1 + P2)));
					end;
				else
					begin
						Yr := Str2Lint (LeftStr (S, P1 - 1));
					end;
				end;

				if Yr < 100 then // If 2 Digit
				begin
					case ESB2DigitYr of
						// edyNone - Nothing has to be done
						edyCutOff: // Process using ESB2DigitCutOff
						begin
							if 1900 + Yr < ESB2DigitCutOff then
								Yr := 2000 + Yr
							else
								Yr := 1900 + Yr
						end;
						edyHistoric: // Take Yr as this year or earlier
						begin
							if 2000 + Yr <= ThisYear then
								Yr := 2000 + Yr
							else
								Yr := 1900 + Yr;
						end;
					end;
				end;
					// Rebuild String
				case DateOrder of
					doMDY, doDMY:
					begin
						S := LeftStr (S, P1 + P2) + LInt2EStr (Yr);
					end;
					doYMD:
					begin
						S := LInt2EStr (Yr) + RightAfterStr (S, P1 - 1);
					end;
				end;
			end
			else
			begin
				// Assume This Year is implied
				case DateOrder of
					doMDY, doDMY:
					begin
						S := S + DateSeparator + LInt2EStr (ThisYear)
					end;
					doYMD:
					begin
						S := LInt2EStr (ThisYear) + DateSeparator + S;
					end;
				end;
			end;
		end
		else
		begin
			// Assume This Month and Year are implied
			case DateOrder of
				doDMY:
				begin
					S := S + DateSeparator + LInt2EStr (ThisMonth)
						+ DateSeparator + LInt2EStr (ThisYear);
				end;
				doMDY:
				begin
					S := LInt2EStr (ThisMonth) + DateSeparator + S
						+ DateSeparator + LInt2EStr (ThisYear);
				end;
				doYMD:
				begin
					S := LInt2EStr (ThisYear) + DateSeparator +
						LInt2EStr (ThisMonth) + DateSeparator + S;
				end;
			end;
		end;

		//Int ensures the fractional Component is 0
		Result := Int (StrToDate (S));
	except
		Result := 0.0;
	end;
end;

function Str2HistoricDate (S: String): TDateTime;
var
	Hold: TESB2DigitYr;
begin
	Hold := ESB2DigitYr;
	ESB2DigitYr := edyHistoric;
	Result := Str2Date (S);
	ESB2DigitYr := Hold;
end;

function Str2CutoffDate (S: string; const CutOff: Word): TDateTime;
var
	Hold1: TESB2DigitYr;
	Hold2: Word;
begin
	Hold1 := ESB2DigitYr;
	Hold2 := ESB2DigitCutOff;
	ESB2DigitYr := edyCutOff;
	ESB2DigitCutOff := CutOff;
	Result := Str2Date (S);
	ESB2DigitYr := Hold1;
	ESB2DigitCutOff := Hold2;
end;

function AddSecs (const DT: TDateTime; const Secs: Extended): TDateTime;
begin
	Result := DT + Secs / (60 * 60 * 24)
end;

function AddMins (const DT: TDateTime; const Mins: Integer): TDateTime;
begin
        //showmessage(Datetimetostr(DT));
	Result := DT + Mins / (60 * 24);
        //showmessage(Datetimetostr(Result));
end;

function AddHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;
begin
	Result := DT + Hrs / 24.0
end;

function AddWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;
begin
	Result := DT + Weeks * 7;
end;

function AddFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;
begin
	Result := AddWeeks (DT, FNights * 2);
end;

function AddMonths (const DT: TDateTime; const Months: Extended): TDateTime;
var
	Day, Month, Year: Word;
	IMonth: Integer;
begin
	DecodeDate (DT, Year, Month, Day);
	IMonth := Month + Trunc (Months);

	if IMonth > 12 then
	begin
		Year := Year + (IMonth - 1) div 12;
		IMonth := IMonth mod 12;
		if IMonth = 0 then
			IMonth := 12;
	end
	else if IMonth < 1 then
	begin
		Year := Year + (IMonth div 12) - 1; // sub years;
		IMonth := 12 - abs (IMonth) mod 12;
	end;
     Month := IMonth;

	// Ensure Day of Month is valid
	if Month = 2 then
	begin
		if IsLeapYear (Year) and (Day > 29) then
			Day := 29
		else	if not IsLeapYear (Year) and (Day > 28) then
			Day := 28;
	end
	else if (Month in [9, 4, 6, 11]) and (Day = 31) then
		Day := 30;

	Result := EncodeDate (Year, Month, Day) + Frac (Months) * 30 +
		Frac (DT);
end;

function AddQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;
begin
	Result := AddMonths (DT, Qtrs * 3);
end;

function AddSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;
begin
	Result := AddMonths (DT, Sems * 6);
end;

function AddYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;
var
	Day, Month, Year: Word;
begin
	DecodeDate (DT, Year, Month, Day);
	Year := Year + Trunc (Yrs);
	if not IsLeapYear (Year) and (Month = 2) and (Day = 29) then
		Day := 28;
	Result := EncodeDate (Year, Month, Day) + Frac (Yrs) * 365.25
		+ Frac (DT);
end;

function GetLocalTZBias: LongInt;
var
	TZ : TTimeZoneInformation;
begin
	case GetTimeZoneInformation (TZ) of
		TIME_ZONE_ID_STANDARD: Result := TZ.Bias + TZ.StandardBias;
		TIME_ZONE_ID_DAYLIGHT: Result := TZ.Bias + TZ.DaylightBias;
	else
		Result := TZ.Bias;
	end;
end;

function GetGMTTime (const DT: TDateTime): TDateTime;
begin
	Result := DT + GetLocalTZBias / (24 * 60);
end;

function GetLocalTime (const DT: TDateTime): TDateTime;
begin
	Result := DT - GetLocalTZBias / (24 * 60);
end;

function GetTimeZoneName: string;
var
	TZ : TTimeZoneInformation;
begin
	case GetTimeZoneInformation (TZ) of
		TIME_ZONE_ID_STANDARD: Result := WideCharToString (TZ.StandardName);
		TIME_ZONE_ID_DAYLIGHT: Result := WideCharToString (TZ.DaylightName);
	else
		Result := '';
	end;
end;

function GetGMTDifference: string;
var
	TZ : TTimeZoneInformation;
begin
	GetTimeZoneInformation (TZ);
	if TZ.Bias = 0 then
		Result := 'GMT'
	else if TZ.Bias < 0 then
	begin
		if TZ.Bias mod 60 = 0 then
			Result := 'GMT+' + IntToStr (Abs (TZ.Bias) div 60)
		else
			Result := 'GMT+' + FloatToStr (Abs (TZ.Bias) / 60)
	end
	else
	begin
		if TZ.Bias mod 60 = 0 then
			Result := 'GMT-' + IntToStr (TZ.Bias div 60)
		else
			Result := 'GMT-' + FloatToStr (TZ.Bias / 60)
	end
end;

function GetLastDayofMonth (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	case M of
		2:
		begin
			if IsLeapYear (Y) then
				D := 29
			else
				D := 28;
		end;
		4, 6, 9, 11: D := 30
		else
			D := 31;
	end;
	Result := EncodeDate (Y, M, D) + Frac (DT);
end;

function GetFirstDayofMonth (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	Result := EncodeDate (Y, M, 1) + Frac (DT);
end;

function GetGoldenNumber (const Year: Word): Integer;
begin
	Result := Year mod 19 + 1;
end;

function GetEpact (const Year: Word): Integer;
var
	Century: Integer;
begin
	Century := Year div 100 + 1;
	Result := ((11 * (GetGoldenNumber (Year) - 1)) mod 30
		+ (8 * Century + 5) div 25) - (3 * Century) div 4  + 8;
	while Result < 1 do
		Result := Result + 30;
	while Result > 30 do
		Result := Result - 30;
end;

function GetEasterSunday (const Year: Word): TDateTime;
var
	C, I, J, H, G, L: Integer;
	D, M: Word;
begin
	G := GetGoldenNumber (Year) - 1;
	C := Year div 100;
	H := (C - C div 4 - (8 * C + 13) div 25 + 19 * G + 15) mod 30;
	I := H - (H div 28) * (1 - (H div 28) * (29 div (H + 1))*((21 - G) div 11));
	J := (Year + Year div 4 + I + 2 - C + C div 4) mod 7;

	L := I - J;
	M := 3 + (L + 40) div 44;
	D := L + 28 - 31 * (M div 4);
	Result := EncodeDate (Year, M, D);
end;

function GetGoodFriday (const Year: Word): TDateTime;
begin
	Result := GetEasterSunday (Year) - 2;
end;

function GMTStr2Value(const GMTStr: string): Extended;
var
	P: Integer;
begin
	P := Pos (GMTStr, '+');
	if P > 0 then
	begin
		Result := Str2Ext (Trim (Copy (GMTStr, P + 1, Length (GMTStr) - P)));
	end
	else
	begin
		P := Pos (GMTStr, '-');
		if P > 0 then
		begin
			Result := -1 * Str2Ext (Trim (Copy (GMTStr, P + 1, Length (GMTStr) - P)));
		end
		else
			Result := 0;
	end;
end;

function ConvertGMTStrTimes (const FromGMTStr: string; const FromDT: TDateTime;
	const ToGMTStr: string): TDateTime;
var
	GMT1, GMT2: Extended;
begin
	GMT1 := GMTStr2Value (FromGMTStr);
	GMT2 := GMTStr2Value (ToGMTStr);
	Result := FromDT + GMT2 - GMT1;
end;

function GetRFC822Difference: string;
var
	TZ : TTimeZoneInformation;
begin
	GetTimeZoneInformation (TZ);
	if TZ.Bias <= 0 then
	begin
		TZ.Bias := Abs (TZ.Bias);
		Result := '+' + LInt2ZStr (TZ.Bias div 60, 2)
			+ LInt2ZStr (TZ.Bias mod 60, 2)
	end
	else
		Result := '-' + LInt2ZStr (TZ.Bias div 60, 2)
			+ LInt2ZStr (TZ.Bias mod 60, 2)
end;

function RFC822Value(const RFC822: string): Extended;
var
	S: String;
	L: LongInt;
begin
	S := UpperCase (Trim (RFC822));
	Result := 0.0;
	if (S = 'GMT') or (S = 'UT') or (S = 'Z') or (S = '') then
		Exit
	else if (S = 'M') then
		Result := -12.0
	else if (S = 'PST') then
		Result := -8.0
	else if (S = 'MST') or (S = 'PDT') then
		Result := -7.0
	else if (S = 'CST') or (S = 'MDT') then
		Result := -6.0
	else if (S = 'EST') or (S = 'CDT') then
		Result := -5.0
	else if (S = 'EDT') then
		Result := -4.0
	else if (S = 'A') then
		Result := -1.0
	else if (S = 'N') then
		Result := 1.0
	else if (S = 'Y') then
		Result := 12.0
	else
	begin
		L := Str2LInt (S);
		Result := L div 100 + (L mod 100) / 60;
	end;
end;

function ConvertRFC822Times (const FromRFC822: string; const FromDT: TDateTime;
	const ToRFC822: string): TDateTime;
var
	X1, X2: Extended;
begin
	X1 := RFC822Value (FromRFC822);
	X2 := RFC822Value (ToRFC822);
	Result := FromDT + (X2 - X1) / 24;
end;

function StartOfWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - DayOfWeek (DT) + 1;
end;

function EndOfWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - DayOfWeek (DT) + 7;
end;

procedure SetLocalTZBias (const Bias: Longint);
var
	TZ : TTimeZoneInformation;
begin
	case GetTimeZoneInformation (TZ) of
		TIME_ZONE_ID_STANDARD: TZ.Bias := Bias - TZ.StandardBias;
		TIME_ZONE_ID_DAYLIGHT: TZ.Bias := Bias - TZ.DaylightBias;
	else
		TZ.Bias := Bias;
	end;
	SetTimeZoneInformation (TZ);
end;

function ThisYear: Word;
begin
	Result := Date2Year (Date);
end;

function ThisMonth: Word;
begin
	Result := Date2Month (Date);
end;

function ThisDay: Word;
begin
	Result := Date2Day (Date);
end;

function ThisHr: Word;
begin
	Result := Time2Hr (Time);
end;

function ThisMin: Word;
begin
	Result := Time2Min (Time);
end;

function ThisSec: Word;
begin
	Result := Time2Sec (Time);
end;

function ThisMSec: Word;
begin
	Result := Time2MSec (Time);
end;

function IsJanuary (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 1;
end;

function IsJanuaryNow: Boolean;
begin
	Result := Date2Month (Date) = 1;
end;

function IsFebruary (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 2;
end;

function IsFebruaryNow: Boolean;
begin
	Result := Date2Month (Date) = 2;
end;

function IsMarch (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 3;
end;

function IsMarchNow: Boolean;
begin
	Result := Date2Month (Date) = 3;
end;

function IsApril (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 4;
end;

function IsAprilNow: Boolean;
begin
	Result := Date2Month (Date) = 4;
end;

function IsMay (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 5;
end;

function IsMayNow: Boolean;
begin
	Result := Date2Month (Date) = 5;
end;

function IsJune (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 6;
end;

function IsJuneNow: Boolean;
begin
	Result := Date2Month (Date) = 6;
end;

function IsJuly (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 7;
end;

function IsJulyNow: Boolean;
begin
	Result := Date2Month (Date) = 7;
end;

function IsAugust (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 8;
end;

function IsAugustNow: Boolean;
begin
	Result := Date2Month (Date) = 1;
end;

function IsSeptember (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 9;
end;

function IsSeptemberNow: Boolean;
begin
	Result := Date2Month (Date) = 9;
end;

function IsOctober (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 10;
end;

function IsOctoberNow: Boolean;
begin
	Result := Date2Month (Date) = 10;
end;

function IsNovember (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 11;
end;

function IsNovemberNow: Boolean;
begin
	Result := Date2Month (Date) = 11;
end;

function IsDecember (const DT: TDateTime): Boolean;
begin
	Result := Date2Month (DT) = 12;
end;

function IsDecemberNow: Boolean;
begin
	Result := Date2Month (Date) = 12;
end;

function Hrs_Min_Sec (Secs: Extended): string;
const
	 OneSecond = 1/24/3600;
var
	Total: Extended;
begin
	Total := Secs * OneSecond;
	Result := Format( '%1.0f days%s', [Int (Total),
		FormatDateTime ('hh:nn:ss', Frac (total))]);
end;

function DatesInSameMonth (const DT1, DT2: TDateTime): Boolean;
begin
	Result := Date2Month (DT1) = Date2Month (DT2);
end;

function DatesInSameYear (const DT1, DT2: TDateTime): Boolean;
begin
	Result := Date2Year (DT1) = Date2Year (DT2);
end;

function DatesInSameMonthYear (const DT1, DT2: TDateTime): Boolean;
begin
	Result := DatesInSameMonth (DT1, DT2) and DatesInSameYear (DT1, DT2);
end;

function AddDays (const DT: TDateTime; const Days: Extended): TDateTime;
begin
	Result := DT + Days;
end;

function IsAM (const DT: TDateTime): Boolean;
begin
	Result := Frac (DT) < 0.5
end;

function IsAMNow : Boolean;
begin
	Result := Frac (Time) < 0.5
end;

function IsPM (const DT: TDateTime): Boolean;
begin
	Result := not IsAM (DT);
end;

function IsPMNow: Boolean;
begin
	Result := not IsAMNow;
end;

function IsNoon (const DT: TDateTime): Boolean;
begin
	Result := Frac (DT) = 0.5;
end;

function IsNoonNow: Boolean;
begin
	Result := Frac (Time) = 0.5;
end;

function IsMidnight (const DT: TDateTime): Boolean;
begin
	Result := Frac (DT) = 0.0;
end;

function IsMidnightNow: Boolean;
begin
	Result := Frac (Time) = 0.0;
end;

function IsSunday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 1;
end;

function IsSundayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 1;
end;

function IsMonday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 2;
end;

function IsMondayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 2;
end;

function IsTuesday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 3;
end;

function IsTuesdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 3;
end;

function IsWednesday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 4;
end;

function IsWednesdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 4;
end;

function IsThursday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 5;
end;

function IsThursdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 5;
end;

function IsFriday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 6;
end;

function IsFridayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 6;
end;

function IsSaturday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) = 7;
end;

function IsSaturdayNow: Boolean;
begin
	Result := DayOfWeek (Date) = 7;
end;

function IsWeekend (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) in [1, 7];
end;

function IsWeekendNow: Boolean;
begin
	Result := DayOfWeek (Date) in [1, 7];
end;

function IsWeekday (const DT: TDateTime): Boolean;
begin
	Result := DayOfWeek (DT) in [2..6];
end;

function IsWeekdayNow: Boolean;
begin
	Result := DayOfWeek (Date) in [2..6];
end;

function DaysApart (const DT1, DT2: TDateTime): LongInt;
begin
	Result := Trunc (DT2) - Trunc (DT1);
end;

function DateIsLeapYear (const DT: TDateTime): Boolean;
begin
	Result := IsLeapYear (Date2Year (DT));
end;

function DaysInMonth (const DT: TDateTime): Byte;
begin
	case Date2Month (DT) of
		2: if DateIsLeapYear (DT) then
			Result := 29
		   else
			Result := 28;
		4, 6, 9, 11: Result := 30;
		else
			Result := 31;
	end;
end;

function DaysInThisMonth: Byte;
begin
	Result := DaysInMonth (Date);
end;

function DaysLeftInMonth (const DT: TDateTime): Byte;
begin
	Result := DaysInMonth (DT) - Date2Day (DT);
end;

function DaysLeftInThisMonth: Byte;
begin
	Result := DaysLeftInMonth (Date);
end;

function DaysInYear (const DT: TDateTime): Word;
begin
	if DateIsLeapYear (DT) then
		Result := 366
	else
		Result := 365;
end;

function DayOfYear (const DT: TDateTime): Word;
begin
	Result := Trunc (DT) - Trunc (EncodeDate (Date2Year (DT), 1, 1)) + 1;
end;

function DaysLeftInYear (const DT: TDateTime): Word;
begin
	Result := DaysInYear (DT) - DayOfYear (DT);
end;

function ThisDayOfYear: Word;
begin
	Result := DayOfYear (Date);
end;

function DaysLeftInThisYear: Word;
begin
	Result := DaysLeftInYear (Date);
end;

function WhichSemester (const DT: TDateTime): Byte;
begin
	Result := (Date2Month (DT) - 1) div 6 + 1;
end;

function WhichQuarter (const DT: TDateTime): Byte;
begin
	Result := (Date2Month (DT) - 1) div 3 + 1;
end;

function GetFirstDayofQuarter (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	case M of
		1..3: M := 1;
		4..6: M := 4;
		7..9: M := 7;
		10..12: M := 10;
	end;
	Result := EncodeDate (Y, M, 1) + Frac (DT);
end;

function GetLastDayofQuarter (const DT: TDateTime): TDateTime;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	case M of
		1..3:
		begin
			M := 3;
			D := 31;
		end;
		4..6:
		begin
			M := 6;
			D := 30;
		end;
		7..9:
		begin
			M := 9;
			D := 30;
		end;
		10..12:
		begin
			M := 12;
			D := 31;
		end;
	end;
	Result := EncodeDate (Y, M, D) + Frac (DT);
end;

function GetFirstDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;
begin
	Result := EncodeDate (Year, (Qtr - 1) * 3 + 1, 1);
end;

function GetLastDayofQuarter2 (const Qtr: Byte; const Year: Word): TDateTime;
var
	D, M: Word;
begin
	case Qtr of
		1:
		begin
			M := 3;
			D := 31;
		end;
		2:
		begin
			M := 6;
			D := 30;
		end;
		3:
		begin
			M := 9;
			D := 30;
		end;
		4:
		begin
			M := 12;
			D := 31;
		end;
		else
		begin
			M := 0;
			D := 0;
		end;
	end;
	Result := EncodeDate (Year, M, D);
end;

function GetFirstDayOfYear (const Year: Word): TDateTime;
begin
	Result := EncodeDate (Year, 1, 1);
end;

function GetLastDayOfYear (const Year: Word): TDateTime;
begin
	Result := EncodeDate (Year, 12, 31);
end;

function SubtractSecs (const DT: TDateTime; const Secs: Extended): TDateTime;
begin
	Result := AddSecs (DT, -1 * Secs);
end;

function SubtractMins (const DT: TDateTime; const Mins: Integer): TDateTime;
begin
	Result := AddMins (DT, -1 * Mins);
end;

function SubtractHrs (const DT: TDateTime; const Hrs: Extended): TDateTime;
begin
	Result := AddHrs (DT, -1 * Hrs);
end;

function SubtractWeeks (const DT: TDateTime; const Weeks: Extended): TDateTime;
begin
	Result := AddWeeks (DT, -1 * Weeks);
end;

function SubtractFortnights (const DT: TDateTime; const FNights: Extended): TDateTime;
begin
	Result := AddWeeks (DT, FNights * -2);
end;

function SubtractMonths (const DT: TDateTime; const Months: Extended): TDateTime;
begin
	Result := AddMonths (DT, -1 * Months);
end;

function SubtractQuarters (const DT: TDateTime; const Qtrs: Extended): TDateTime;
begin
	Result := AddMonths (DT, Qtrs * -3);
end;

function SubtractSemesters (const DT: TDateTime; const Sems: Extended): TDateTime;
begin
	Result := AddMonths (DT, Sems * -6);
end;

function SubtractYrs (const DT: TDateTime; const Yrs: Extended): TDateTime;
begin
	Result := AddYrs (DT, -1 * Yrs);
end;

function SubtractDays (const DT: TDateTime; const Days: Extended): TDateTime;
begin
	Result := DT - Days;
end;

function AgeAtDate (const DOB, DT: TDateTime): Integer;
var
	D1, M1, Y1, D2, M2, Y2: Word;
begin
	if DT < DOB then
		Result := -1
	else
	begin
		DecodeDate (DOB, Y1, M1, D1);
		DecodeDate (DT, Y2, M2, D2);
		Result := Y2 - Y1;
		if (M2 < M1) or ((M2 = M1) and (D2 < D1)) then
			Dec (Result);
	end;
end;

function AgeNow (const DOB: TDateTime): Integer;
begin
	Result := AgeAtDate (DOB, Date);
end;

function DOW2Int (const DOW: string): Integer;
var
	UCDOW: string;
	I,N: Integer;
begin
	Result := 0;
	UCDOW := UpperCase (DOW);
	N := Length (DOW);
	for I := 1 to 7 do
	begin
		if LeftStr (DayOfWeekStrings [I], N) = UCDOW then
		begin
			Result := I;
			Break;
		end;
	end;
end;

function Month2Int (const Month: string): Integer;
var
	UCMonth: string;
	I,N: Integer;
begin
	Result := 0;
	UCMonth := UpperCase (Month);
	N := Length (Month);
	for I := 1 to 12 do
	begin
		if LeftStr (MonthStrings [I], N) = UCMonth then
		begin
			Result := I;
			Break;
		end;
	end;
end;

function ExactWeeksApart (const DT1, DT2: TDateTime): Extended;
begin
	Result := DaysApart (DT1, DT2) / 7;
end;

function WeeksApart (const DT1, DT2: TDateTime): Integer;
begin
	Result := DaysApart (DT1, DT2) div 7;;
end;

function GetFirstSundayOfYear (const Year: Word): TDateTime;
var
	StartYear: TDateTime;
begin
	StartYear := GetFirstDayOfYear (Year);
	if DayOfWeek (StartYear) = 1 then
		Result := StartYear
	else
		Result := StartOfWeek (StartYear) + 7;
end;

function Date2WeekNo (const DT: TDateTime): Integer;
var
	Year: Word;
	FirstSunday, StartYear: TDateTime;
	WeekOfs: Byte;
begin
	Year := Date2Year (DT);
	StartYear := GetFirstDayOfYear (Year);
	if DayOfWeek (StartYear) = 0 then
	begin
		FirstSunday := StartYear;
		WeekOfs := 1;
	end
	else
	begin
		FirstSunday := StartOfWeek (StartYear) + 7;
		WeekOfs := 2;
		if DT < FirstSunday then
		begin
			Result := 1;
			Exit;
		end;
	end;
	Result := DaysApart (FirstSunday, StartofWeek (DT)) div 7 + WeekOfs;
end;

function DatesInSameWeekNo (const DT1, DT2: TDateTime): Boolean;
begin
	if Date2Year (DT1) <> Date2Year (DT2) then
		Result := False
	else
		Result := Date2WeekNo (DT1) = Date2WeekNo (DT2);
end;

function WeekNosApart (const DT1, DT2: TDateTime): Integer;
begin
	if Date2Year (DT1) <> Date2Year (DT2) then
		Result := -999
	else
		Result := Date2WeekNo (DT2) - Date2WeekNo (DT1);
end;

function ThisWeekNo: Integer;
begin
	Result := Date2WeekNo (Date);
end;

function StartOfWeekNo (const WeekNo, Year: Word): TDateTime;
var
	FirstSunday: TDateTime;
begin
	FirstSunday := GetFirstSundayOfYear (Year);
	if Date2Day (FirstSunday) = 1 then
		Result := AddWeeks (FirstSunday, WeekNo - 1)
	else
		Result := AddWeeks (FirstSunday, WeekNo - 2)
end;

function EndOfWeekNo (const WeekNo, Year: Word): TDateTime;
begin
	Result := StartOfWeekNo (WeekNo, Year) + 6;
end;

function DWY2Date (const DOW, WeekNo, Year: Word): TDateTime;
begin
	Result := StartOfWeekNo (WeekNo, Year) + DOW - 1;
end;

function AgeAtDateInMonths (const DOB, DT: TDateTime): Integer;
{ Routine donated by David Gobbett}
var
   D1, D2 : Word;
   M1, M2 : Word;
   Y1, Y2 : Word;
begin
	if DT < DOB then
		Result := -1
	else
	begin
		DecodeDate (DOB, Y1, M1, D1);
		DecodeDate (DT, Y2, M2, D2);
		if Y1 = Y2 then // Same Year
			Result := M2 - M1
		else // Different Years
		begin
			// 12 months per year age
			Result := 12 * AgeAtDate (DOB, DT);
			if M1 > M2 then
				Result := Result + (12 - M1) + M2
			else if M1 < M2 then
				Result := Result + M2 - M1
			else	if D1 > D2 then // Same Month
				Result := Result + 12;
		end;
		if D1 > D2 then // we have counted one month too many
			Dec (Result);
	end;
end;

function AgeAtDateInWeeks (const DOB, DT: TDateTime): Integer;
{ Routine donated by David Gobbett}
begin
	if DT < DOB then
		Result := -1
	else
	begin
		Result := Trunc (DT - DOB) div 7;
	end; {else}
end;

function AgeNowInMonths (const DOB: TDateTime): Integer;
{ Routine donated by David Gobbett}
begin
	Result := AgeAtDateInMonths (DOB, Date);
end;

function AgeNowInWeeks (const DOB: TDateTime): Integer;
{ Routine donated by David Gobbett}
begin
	Result := AgeAtDateInWeeks (DOB, Date);
end;

function AgeNowDescr (const DOB: TDateTime): String;
{ Routine donated by David Gobbett}
var
	Age : integer;
begin
	Age := AgeNow (DOB);
	if Age > 0 then
	begin
		if Age = 1 then
			Result := LInt2EStr (Age) + ' year'
		else
			Result := LInt2EStr (Age) + ' years';
	end
	else
	begin
		Age := AgeNowInMonths (DOB);
		if Age >= 2 then
			Result := LInt2EStr(Age) + ' months'
		else
		begin
			Age := AgeNowInWeeks (DOB);
			if Age = 1 then
				Result := LInt2EStr(Age) + ' week'
			else
				Result := LInt2EStr(Age) + ' weeks';
		end;
	end;
end;

function ISODayOfWeek (const DT: TDateTime): Integer;
begin
	Result := DayOfWeek (DT);
	Dec (Result);
	if Result = 0 then
		Result := 7;
end;

function StartOfISOWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - ISODayOfWeek (DT) + 1;
end;

function EndOfISOWeek (const DT: TDateTime): TDateTime;
begin
	Result := DT - ISODayOfWeek (DT) + 7;
end;

{: Most years have 52 weeks, but years that start on a Thursday and leap
years that start on a Wednesday (or Thursday) have 53 weeks. Based on
code supplied by Niklas Astram }
function ISOWeeksInYear (const Year: Word): Byte;
var
	DOW: Integer;
begin
	DOW := ISODayOfWeek (GetFirstDayOfYear (Year));
	if (DOW = 4) or ((DOW = 3) and IsLeapYear (Year)) then
		Result := 53
	else
		Result :=52;
end;

procedure Date2ISOWeekNo (const DT: TDateTime; var WeekNo: Byte;
	var Year: Word);
var
	FirstMonday, StartYear: TDateTime;
	WeekOfs: Byte;
begin
	Year := Date2Year (DT);
	StartYear := GetFirstDayOfYear (Year) + 3; // Jan 4th
	if ISODayOfWeek (StartYear) <= 4 then
	begin
		FirstMonday := StartOfISOWeek (StartYear);
		WeekOfs := 1;
		if DT < FirstMonday then
		begin
			Dec (Year);
			WeekNo := ISOWeeksInYear (Year);
			Exit;
		end;
	end
	else
	begin
		FirstMonday := StartOfISOWeek (StartYear) + 7;
		WeekOfs := 2;
		if DT < FirstMonday then
		begin
			WeekNo := 1;
			Exit;
		end;
	end;
	WeekNo := DaysApart (FirstMonday, StartofISOWeek (DT)) div 7 + WeekOfs;
	if WeekNo > ISOWeeksInYear (Year) then
	begin
		WeekNo := 1;
		Inc (Year);
	end;
end;

function Date2ISOWeekStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + 'W' + LInt2ZStr (WeekNo, 2)
		+ LInt2EStr (ISODayOfWeek (DT));
end;

function Date2ISOWeekEnhStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + '-W' + LInt2ZStr (WeekNo, 2) + '-'
		+ LInt2EStr (ISODayOfWeek (DT));
end;

function Date2ISOWeekOnlyStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + 'W' + LInt2ZStr (WeekNo, 2);
end;

function Date2ISOWeekOnlyEnhStr (const DT: TDateTime): string;
var
	WeekNo: Byte;
	Year: Word;
begin
	Date2ISOWeekNo (DT, WeekNo, Year);
	Result := LInt2ZStr (Year, 4) + '-W' + LInt2ZStr (WeekNo, 2);
end;

function Date2ISOStr (const DT: TDateTime): string;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	Result := LInt2ZStr (Y, 4) + LInt2ZStr (M, 2)
		+ LInt2ZStr (D, 2);
end;

function Date2ISOInt (const DT: TDateTime): Cardinal;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	Result := Y * 10000 + M * 100 + D;
end;

function Date2ISOEnhStr (const DT: TDateTime): string;
var
	D, M, Y: Word;
begin
	DecodeDate (DT, Y, M, D);
	Result := LInt2ZStr (Y, 4) + '-' + LInt2ZStr (M, 2) + '-'
		+ LInt2ZStr (D, 2);
end;

function DatesInSameISOWeekNo (const DT1, DT2: TDateTime): Boolean;
var
	W1, W2: Byte;
	Y1, Y2: Word;
begin
	Date2ISOWeekNo (DT1, W1, Y1);
	Date2ISOWeekNo (DT2, W2, Y2);
	Result := (W1 = W2) and (Y1 = Y2);
end;

function ISOWeekNosApart (DT1, DT2: TDateTime): Integer;
var
	W1, W2: Byte;
	I, Y1, Y2: Word;
	Negative: Boolean;
	DTHold: TDateTime;
begin
	Negative := Int (DT2) < Int (DT1);
	if Negative then
	begin
		DTHold := DT1;
		DT1 := DT2;
		DT2 := DTHold;
	end;

	// Now DT1 <= DT2

	Date2ISOWeekNo (DT1, W1, Y1);
	Date2ISOWeekNo (DT2, W2, Y2);
	if Y1 = Y2 then
		Result := W2 - W1
	else
	begin
		Result := ISOWeeksInYear (Y1) - W1 + W2;
		for I := Y1 + 1 to Y2 - 1 do
			Result := Result + ISOWeeksInYear (I)
	end;

	if Negative then
		Result := -1 * Result;
end;

procedure ThisISOWeekNo (var WeekNo: Byte; var Year: Word);
begin
	Date2ISOWeekNo (Date, WeekNo, Year);
end;

function GetFirstMondayOfYear (const Year: Word): TDateTime;
var
	StartYear: TDateTime;
begin
	StartYear := GetFirstDayOfYear (Year);
	if ISODayOfWeek (StartYear) = 1 then
		Result := StartYear
	else
		Result := StartOfISOWeek (StartYear) + 7;
end;

function StartOfISOWeekNo (const WeekNo, Year: Word): TDateTime;
var
	FirstMonday: TDateTime;
begin
	FirstMonday := GetFirstMondayOfYear (Year);
	if Date2Day (FirstMonday) < 5 then
		Result := AddWeeks (FirstMonday, WeekNo - 1)
	else
		Result := AddWeeks (FirstMonday, WeekNo - 2)
end;

function EndOfISOWeekNo (const WeekNo, Year: Word): TDateTime;
begin
	Result := StartOfISOWeekNo (WeekNo, Year) + 6;
end;

function ISOYWD2Date (const Year: Word; const WeekNo, DOW: Byte): TDateTime;
begin
	Result := StartOfISOWeekNo (WeekNo, Year) + DOW - 1;
end;

function ElapsingTime (DT1, DT2: TDateTime ): string;

	function GetPadChar (ReturnChar: Boolean): string;
	begin
		if ReturnChar then
			Result := ' '
		else
			Result := '';
	end;

	function SetDTString (Value: LongInt; const OneStr, TwoStr: string): string;
	begin
		Result := '';
		if Value = 1 then
			Result := Format ('%d ' + OneStr, [1])
		else if Value > 1 then
			Result := Format( '%d ' + TwoStr, [Value] );
	end;

const
	OneWeek = 'week';
	FewWeeks = 'weeks';
	OneDay = 'day';
	FewDays = 'days';
	OneHour = 'hr';
	FewHours = 'hrs';
	OneMin = 'min';
	FewMins = 'mins';
	OneSec = 'sec';
	FewSecs = 'secs';
	OneMSec = 'msec';
	FewMSecs = 'msecs';

var
	Week, Day: LongInt;
	Hour, Min, Sec, MSec: Word;
	DTHold: TDateTime;
	PadChar: string;
begin
	if DT2 < DT1 then
	begin
		DTHold := DT1;
		DT1 := DT2;
		DT2 := DTHold;
	end;

	Week := Trunc (ExactWeeksApart (DT1, DT2));
	Day := DaysApart (DT1, DT2) - (Week * 7);
	DecodeTime (DT2 - DT1, Hour, Min, Sec, MSec);

	// Week
	Result := SetDTString (Week, OneWeek, FewWeeks);

	// Day
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Day, OneDay, FewDays);

	// Hour
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Hour, OneHour, FewHours);

	// Min
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Min, OneMin, FewMins);

	// Sec
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (Sec, OneSec, FewSecs);

	// MSec
	PadChar := GetPadChar (Result <> '');
	Result := Result + PadChar + SetDTString (MSec, OneMSec, FewMSecs);
end;

{!~ Returns True if DateString is a valid date,False otherwise.}
Function IsDate(DateString: String): Boolean;
Begin
  Try
    StrToDateTime(DateString);
    Result := True;
  Except
    Result := False;
  End;
End;

Function IsTime(TimeString: String): Boolean;
Begin
  Try
    StrToDateTime(TimeString);
    Result := True;
  Except
    Result := False;
  End;
End;

//DT2 less DT1
function PCMinutesApart (const DT1, DT2: TDateTime): Integer;
Begin
 //       Result := MinutesBetween(DT2, DT1);
        if (CompareDateTime(DT1, DT2)=1) then Result := (MinutesBetween(DT1, DT2))*-1;
        if (CompareDateTime(DT1, DT2)=-1) then Result := (MinutesBetween(DT1, DT2));
        if (CompareDateTime(DT1, DT2)=0) then Result := 0;
      //Result := MinutesBetween(CurTime, FutTime);
       //            DaysBetween(const ANow, AThen: TDateTime): Integer;
       //YearsBetween(const ANow, AThen: TDateTime): Integer;
       //CompareDateTime(const A, B: TDateTime): TValueRelationship;
//-1 LessThanValue	The first value is less than the second value.
//0  EqualsValue	The two values are equal.
//1  GreaterThanValue	The first value is greater than the second value.
End;


end.

