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
        $location = trim($request->getParameter('location', ''));
        $isAll = trim($request->getParameter('isAll', ''));
        $isAll = ($isAll == '') ? 0 : 1;
        if (!$location && $location == '') {
            $strLocation = 'H004,H008,VN';
            $arrLocation = explode(',', $strLocation);
            $arrLocationName = [
                'H004' => 'Hà Nội',
                'H008' => 'HCM',
                'VN' => 'Đà Nẵng',
            ];
            $arrMassage = [];

            if (!empty($arrLocation)) {
                foreach ($arrLocation as $code) {
                    $listMassage = adMassageTable::getListMassageByLocation($code, 4);
                    $arrMassage[$code] = $listMassage;
                }
            }
            $this->arrLocation = $arrLocation;
            $this->arrMassage = $arrMassage;
            $this->arrLocationName = $arrLocationName;
        }
        $this->location = $location;
        $this->isAll = $isAll;
    }

    public function executeListMessage(sfWebRequest $request)
    {

    }

    public function executeListMessage2(sfWebRequest $request)
    {

    }

    public function executeDetailItem(sfWebRequest $request)
    {
        $slug = $request->getParameter('slug');
        $massage = false;
        $slide = false;
        if ($slug) {
            $massage = adMassageTable::checkSlug($slug);
            $slide = adMassageImageTable::getListSlideByMassage($massage[0]['id']);
        }
        $this->massage = $massage;
        $this->listSlide = $slide;
    }


    public function executeAjaxLoadListItem(sfWebRequest $request)
    {
        $this->getResponse()->setHttpHeader('Content-type', 'application/json');
        $page = intval(trim($request->getParameter('page', 1)));
        $location = trim($request->getParameter('location', 0));
        $isAll = trim($request->getParameter('isAll', 0));
        $limit = 8;
        $offset = ($page - 1) * $limit;
        $listItem = adMassageTable::getListMassage($limit, $offset, $location, $isAll);
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
