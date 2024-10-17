<?php

if(!function_exists('myfunction')){

    function filterHelper($products, $request){
        $wantedProducts = array();
        foreach($products as $product){
            $isValid = true;
            // $mergeAttributes = array_column($product->productAttributes->all(), 'attribute_id', 'values');
            foreach($request->all() as $attr){
                // $existValue = isset($mergeAttributes[$attr['attribute_id']]) ? $mergeAttributes[$attr['attribute_id']] : 0;

                // if($attr['type'] == 'text')
                if($isValid) $isValid = doesExistValue($product->productAttributes->all(), $attr);

                // if($attr['type'] == 'range'){
                //     if($isValid) $isValid = ($existValue > $attr['values'][0] &&  $existValue < $attr['values'][1]);
                // }

            }

            if($isValid){
                array_push($wantedProducts, $product);
            }
        }

        return $wantedProducts;
    }

    function doesExistValue($productAttrs, $attr){
        $isExist = false;
        foreach($productAttrs as $productAttr){
            if($productAttr['attribute_id'] == $attr['attribute_id']){
                if($attr['type'] == 'text' ){
                    $isExist =  in_array($productAttr['values'],$attr['values']);
                }
                else{
                    $isExist = ($productAttr['values'] >= $attr['values'][0] &&  $productAttr['values'] <= $attr['values'][1]);
                }
               if($isExist) return $isExist;
            }
        }
        return $isExist;
    }
}


if(!function_exists('doesActiveSubscriber')){

    function doesActiveSubscriber($user){
        $currentUser = $user;
        $active = false;
        $includeTeam = false;

        if($currentUser->team){
            $currentUser = App\Models\User::find($user->team);
            $includeTeam = true;
        }

        // if($currentUser->subscriptions){
        //     foreach($currentUser->subscriptions as $subscription ){
        //         if($includeTeam){
        //             if(explode("_", $subscription->name)[0] == 'team')
        //                 $active = $currentUser->subscribed($subscription->name);
        //         }
        //         else {
        //             $active = $currentUser->subscribed($subscription->name);
        //         }
        //         if($active) break;
        //     }
        // }


        if($currentUser->subscriptions){
            foreach($currentUser->subscriptions as $subscription ){
                if($includeTeam){
                    if(explode("_", $subscription->name)[0] == 'team' && $subscription->stripe_status == 'active')
                        $active = $currentUser->subscribed($subscription->name);
                }
                elseif($subscription->stripe_status == 'active') {
                    $active = $currentUser->subscribed($subscription->name);
                }
                if($active) break;
            }
        }

        return $active;
    }
}



if(!function_exists('getThumbnails')){

    function getThumbnails($record, $type){
        if($record){
            // return $record['id'];
            $extension = explode(".", $record->name)[1];
            $url = $record->name;

            if($extension == 'jfif'){
                $url = explode(".", $record->name)[0] . '.jpg';
            }

            $supportExtensions = array("jpg", "png", "tiff", "webp", "svg","jpeg","jfif");
            if(in_array(strtolower($extension), $supportExtensions)){
                if($type == 'small')
                    return env('CLOUDFORMATION_CLOUDFRONT_URL'). '/fit-in/600x600/' . $record->id. "___" . $url;
                else
                    return env('CLOUDFORMATION_CLOUDFRONT_URL'). '/' . $record->id. "___" . $url;
            }
            else{
                return env('CLOUDFRONT_URL'). '/' . $record->id. "___" . $url;
            }
        }
        else
            return '';

    }
}



if(!function_exists('getRelatedProducts')){

    function getRelatedProducts($products, $product){

        $relatedProducts = array();
        $productTagsIds = array_column(json_decode(json_encode($product->tags), true), 'id');
        $productAttributesIdVals = array_column(json_decode(json_encode($product->productAttributes), true),'values', 'attribute_id');

        foreach($products as $item){
            $item['points'] = (int) similar_text($product->description, $item->description);
            $item['points'] += ((int) similar_text($product->title, $item->title) * 10 );

            foreach($item->tags as $tag){
                if(in_array($tag->id,$productTagsIds)){
                    $item['points'] += 50;
                }
            }

            foreach($item->productAttributes as $attr){
                if(isset($productAttributesIdVals[$attr->attribute_id]) &&  $productAttributesIdVals[$attr->attribute_id] == $attr->values){
                  $item['points'] += 10;
                }
            }
            array_push($relatedProducts, $item);
        }

        usort($relatedProducts, function($a, $b){
            if ($a['points'] == $b['points']) {
                return 0;
            }
            return ($a['points'] > $b['points']) ? -1 : 1;
        });

        return array_slice($relatedProducts,0,15);
    }

}
