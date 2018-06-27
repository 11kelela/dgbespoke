<?php

/**
 * pageHome actions.
 *
 * @package    VTP2.0
 * @subpackage pageHome
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class pageHomeActions extends sfActions
{
    public function executeIndex(sfWebRequest $request)
    {

    }

    public function executeDetailItem(sfWebRequest $request)
    {

    }


    public function executeAjaxLoadListItem(sfWebRequest $request)
    {
        $this->getResponse()->setHttpHeader('Content-type', 'application/json');
        $page = $request->getParameter('page', 1);
        $limit = 8;
        $offset = ($page - 1) * $limit;
        $listItem = adMassageTable::getListMassage($limit, $offset);
//        if ($listItem) {
        $errCode = 0;
//        } else {
//            $errCode = 1;
//        }
        $html = $this->getPartial('pageHome/listItem', array(
            'listItem' => $listItem,
            'page' => $page,
        ));

        $arrReturn = [
            'errCode' => $errCode,
            'page' => (count($listItem) < $limit) ? $page : $page + 1,
            'html' => $html
        ];
        return $this->renderText(json_encode($arrReturn));
    }
}
