<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends Application {

    public function index() {

        $this->data['welcome'] = $this->welcome();
        $this->data['pagebody'] = 'welcome';
        $this->render();
    }

    private function welcome_week() {

        $rows = array();
        foreach ($this->timetable->getWeek() as $record) {
            $rows[] = (array) $record;
        }
        $this->data['week'] = $rows;

        return $this->parser->parse('welcome', $this->data, true);
    }

    private function welcome_time() {
        $rows = array();
        foreach ($this->timetable->getTime() as $record) {
            $rows[] = (array) $record;
        }
        $this->data['time'] = $rows;

        return $this->parser->parse('welcome', $this->data, true);
    }

    private function welcome_clasess() {

        $rows = array();
        foreach ($this->timetable->getClasses() as $record) {
            $rows[] = (array) $record;
        }
        $this->data['classes'] = $rows;

        return $this->parser->parse('welcome', $this->data, true);
    }

}
