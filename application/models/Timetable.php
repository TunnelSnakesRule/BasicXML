<?php

class Timetable extends CI_Model {

    protected $xml = null;
    protected $days = array();
    protected $periods = array();
    protected $classes = array();

    public function __construct() {


        foreach ($this->xml->week->day as $day) {
            foreach ($day->weekslot as $weekslot) {
                $this->week[] = new Slot($weekslot, $day);
            }
        }


        foreach ($this->xml->time->time as $time) {
            foreach ($time->timeslot as $timeslot) {
                $this->time[] = new Slot($timeslot, $time);
            }
        }


        foreach ($this->xml->classes->class as $class) {
            foreach ($class->classslot as $classslot) {
                $this->classes[] = new Slot($classslot, $class);
            }
        }
    }

    public function getDays() {
        return $this->week;
    }

   
    public function getTime() {
        return $this->time;
    }

    
    public function getClasses() {
        return $this->classes;
    }

   
    public function getDayList() {
        $dayList = array(
            'Monday' => array(
                'value' => 'Monday'
            ),
            'Tuesday' => array(
                'value' => 'Tuesday'
            ),
            'Wednesday' => array(
                'value' => 'Wednesday'
            ),
            'Thursday' => array(
                'value' => 'Thursday'
            ),
            'Friday' => array(
                'value' => 'Friday'
            )
        );

        return $dayList;
    }

    public function getTimeList() {
        $timeList = array(
            '0830' => array(
                'value' => '0830'
            ),
            '0930' => array(
                'value' => '0930'
            ),
            '1030' => array(
                'value' => '1030'
            ),
            '1130' => array(
                'value' => '1130'
            ),
            '1230' => array(
                'value' => '1230'
            ),
            '1330' => array(
                'value' => '1330'
            ),
            '1430' => array(
                'value' => '1430'
            ),
            '1530' => array(
                'value' => '1530'
            ),
            '1630' => array(
                'value' => '1630'
            ),
        );

        return $timeList;
    }

}

